require 'sinatra/base'
require 'sinatra/reloader'
require 'bcrypt'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/utilities'

ENV['ENV'] = 'test'

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get '/' do
    @users_repo = UserRepository.new
    peeps_repo = PeepRepository.new
    @latest_peeps = peeps_repo.all_reverse_chron

    return erb(:index)
  end

  get '/index' do
    return redirect('/')
  end

  get '/peeps/new' do
    if session[:user_id].nil?
      return erb(:login)
    else
      return erb(:new_peep)
    end
  end

  get '/peeps/:id' do
    peep_id = params[:id]
    @users_repo = UserRepository.new
    peeps_repo = PeepRepository.new

    @thread = peeps_repo.find_thread(peep_id)

    return erb(:peep)
  end

  get '/peeps/:id/reply' do
    if session[:user_id].nil?
      return erb(:login)
    else
      peep_id = params[:id]
      @users_repo = UserRepository.new
      peeps_repo = PeepRepository.new

      @peep = peeps_repo.find_by_id(peep_id)

      return erb(:peep_reply)
    end
  end

  get '/signup' do
    return erb(:signup)
  end

  get '/login' do
    return erb(:login)
  end

  post '/signup' do
    repo = UserRepository.new
    utilities = Utilities.new

    username = params[:username]
    email = params[:email]
    name = params[:name]
    password = BCrypt::Password.create(params[:password])

    if utilities.validate_email(email) && utilities.validate_name(name) && utilities.validate_username(username)

      new_user = User.new
      new_user.email = params[:email]
      new_user.password =
        new_user.name = params[:name]
      new_user.username = params[:username]

      begin
        repo.create(new_user)
        return erb(:user_created)
      rescue StandardError
        @alert = 'Email address and/or username already in use'
        return erb(:signup)
      end
    else
      @alert = 'Please check your input'
      return erb(:signup)
    end
  end

  post '/login' do
    repo = UserRepository.new
    utilities = Utilities.new
    email = params[:email]
    password = params[:password]

    return erb(:login_error) unless utilities.validate_email(email)

    user = repo.find_by_email(email)

    return erb(:login_error) if user.nil?

    if BCrypt::Password.new(user.password) == password
      session[:user_id] = user.id
      @username = user.username
      return erb(:login_success)
    else
      return erb(:login_error)
    end
  end

  get '/logout' do
    if session[:user_id]
      session[:user_id] = nil
      return redirect('/index')
    end
  end

  post '/peeps/new' do
    utilities = Utilities.new
    repo = PeepRepository.new
    peep = Peep.new
    peep.user_id = session[:user_id]
    peep.content = utilities.sanitize(params[:content])
    peep.creation_time = Time.now.getutc.strftime('%Y-%m-%d %H:%M:%S')
    peep.link_to = 0
    repo.create(peep)

    utilities = Utilities.new
    usernames = utilities.check_for_tag(peep.content)

    unless usernames.nil?
      emails = utilities.find_email_addresses(usernames)
      emails.each do |email|
        utilities.send_email(email)
      end
    end

    return redirect('/index')
  end

  post '/peeps/:id/reply' do
    utilities = Utilities.new
    repo = PeepRepository.new
    peep = Peep.new
    peep.user_id = session[:user_id]
    peep.content = utilities.sanitize(params[:content])
    peep.creation_time = Time.now.getutc.strftime('%Y-%m-%d %H:%M:%S')
    peep.link_to = params[:id]
    repo.create(peep)
    return redirect("/peeps/#{params[:id]}")
  end

  # TODO: Send email when tagged
end
