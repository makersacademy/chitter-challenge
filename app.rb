require "sinatra"
require "sinatra/reloader"
require_relative "lib/database_connection"
require_relative "lib/user_repository"
require_relative "lib/peep_repository"
require "date"
require "bcrypt"

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/user_repository'
    also_reload 'lib/peep_repository'
  end

  get '/' do
    @title = "Chitter - Home"
    @peeps = PeepRepository.new.all
    return erb(:index)
  end

  get '/peeps/new' do
    redirect '/login' if session[:username] == nil
    @title = "Chitter - Create a new peep"
    return erb(:new_peep)
  end

  post '/peeps' do
    if invalid_peep_request_parameters?
      status 400
      return ''
    end

    repo = PeepRepository.new
    peep = Peep.new
    peep.content = params[:peep]
    peep.user_id = session[:user_id]

    repo.create(peep)
    return erb(:peep_created)
  end

  get '/signup' do
    logged_in?
    @title = "Chitter - Sign up to Chitter!"
    @message = ""
    return erb(:signup)
  end

  post '/signup' do
    if invalid_signup_request_parameters?
      status 400
      return ''
    end

    repo = UserRepository.new

    # check if the username is already taken
    if repo.username_exists?(params[:username].downcase)
      @message = "That username is already taken."
      return erb(:signup)
    end

    # check if the email is already registered
    if repo.email_exists?(params[:email].downcase)
      @message = "That email address is already registered."
      return erb(:signup)
    end

    # check passwords match
    if params[:password] != params[:confirm_password]
      @message = "Sorry, the passwords entered did not match :("
      return erb(:signup)
    end

    user = User.new
    user.username = params[:username].downcase
    user.name = params[:name]
    user.email = params[:email].downcase
    user.password = params[:password]

    repo.create(user)
    return erb(:user_created)
  end

  get '/login' do
    logged_in?
    @title = "Chitter - Log in to Chitter"
    @message = ""
    return erb(:login)
  end

  post '/login' do
    if invalid_login_request_parameters?
      status 400
      return ''
    end

    repo = UserRepository.new
    user = repo.find(params[:email])

    if user
      if BCrypt::Password.new(user.password) == params[:password]
        session[:username] = user.username
        session[:user_id] = user.id
        @heading = "Hello, #{user.username}"
        redirect '/'
      else
        redirect '/login'
      end
    else
      redirect '/login'
    end
  end

  get '/logout' do
    session.destroy
    redirect "/"
  end

  def logged_in?
    # check if the user is already logged in
    redirect '/' if session[:username] != nil
  end

  def invalid_peep_request_parameters?
    # Are the params nil?
    return true if params[:peep] == nil
    # Are they empty strings?
    return true if params[:peep] == ""
    return false
  end

  def invalid_signup_request_parameters?
    # Are the params nil?
    return true if params[:username] == nil || params[:name] == nil || params[:email] == nil || params[:password] == nil || params[:confirm_password] == nil
    # Are they empty strings?
    return true if params[:username] == "" || params[:name] == "" || params[:email] == "" || params[:password] == "" || params[:confirm_password] == ""
    return false
  end

  def invalid_login_request_parameters?
    # Are the params nil?
    return true if params[:email] == nil || params[:password] == nil
    # Are they empty strings?
    return true if params[:email] == "" || params[:password] == ""
    return false
  end
end