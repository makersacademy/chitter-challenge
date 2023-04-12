require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/peep_repository'
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
    message = params[:message]
    author_id = session[:user_id]
    timestamp = Time.now.strftime "%Y-%m-%d %H:%M:%S"

    PeepRespository.new.create(message, timestamp, author_id)

    return redirect ('/')
  end

  get '/login' do
    redirect_if_logged_in

    return erb(:login)
  end

  post '/login_attempt' do
    # TODO : Santise user input from this form
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
    # TODO : Santise user input from this form
    redirect_if_logged_in

    return erb(:register)
  end

  post '/submit_register' do

    @username = params[:username]
    name = params[:name]
    email = params[:email]
    password = params[:password]

    registration = UserRepository.new.register(@username, name, email, password)

    if registration[:success?]
      return erb(:registration_success)
    else
      @failure_reason = registration[:failure_reason]
      return erb(:registration_failure)
    end
  end

  def redirect_if_logged_in
    if session[:user_id]
      return redirect('/')
    end
  end
end