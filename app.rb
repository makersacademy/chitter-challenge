require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
require_relative 'lib/tag_repository'
require_relative 'lib/user'
require_relative 'lib/user_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  get '/' do
    @all_peeps = PeepRespository.new.all_with_author
    return erb(:index)
  end

  post '/peep' do
    return invalid_params_response if invalid_request_parameters?
    message = sanitize_user_input(params[:message])
    author_id = session[:user_id]
    timestamp = Time.now.strftime "%Y-%m-%d %H:%M:%S"

    peep_repo = PeepRespository.new

    peep_repo.create(message, timestamp, author_id)
    peep_id = peep_repo.most_recent_peep_id
    tag_repo = TagRepository.new

    tagged_users = tag_repo.check_message_for_tags(message)
    tag_repo.add_tags_by_peep(tagged_users, peep_id) if tagged_users

    return redirect ('/')
  end

  get '/login' do
    redirect_if_logged_in

    return erb(:login)
  end

  post '/login_attempt' do
    redirect_if_logged_in

    username = params[:username]
    password = params[:password]

    # Returns a hash
    login = UserRepository.new.login(params[:username], params[:password])

    if login[:success?]
      session[:user_id] = login[:user_id]
      session[:username] = login[:username]
      return redirect('/')
    else
      @failure_reason = login[:failure_reason]
      status 401
      return erb(:login_denied)
    end
  end

  get '/register' do
    redirect_if_logged_in

    return erb(:register)
  end

  post '/submit_register' do
    return invalid_params_response if invalid_request_parameters?

    @username = params[:username]
    name = params[:name]
    email = params[:email]
    password = params[:password]

    registration = UserRepository.new.register(@username, name, email, password)

    return erb(:registration_success) if registration[:success?]

    @failure_reason = registration[:failure_reason]
    return erb(:registration_failure)
  end

  post '/logout' do
    session[:user_id] = nil
    session[:username] = nil
    redirect('/')
  end

  def redirect_if_logged_in
    return redirect('/') if session[:user_id]
  end

  def sanitize_user_input(string)
    string.gsub!(/\&/, '&amp;')
    string.gsub!(/\</, '&lt;')
    string.gsub!(/\>/, '&gt;')
    string.gsub!(/\"/, '&quot;')
    string.gsub!(/\'/, '&apos;')
    return string
  end

  def invalid_request_parameters?
    params.any? { |_key, value| value.nil? || value == "" } ? true : false
  end

  def invalid_params_response
    status 400
    return "Invalid form parameters entered, please rety and ensure you fill out all fields."
  end
end
