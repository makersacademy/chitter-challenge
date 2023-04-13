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
    return erb(:signup)
  end

  post '/signup' do
    if invalid_signup_request_parameters?
      status 400
      return ''
    end

    repo = UserRepository.new

    if repo.username_exists?(params[:username].downcase)
      @error_msg = "That username is already taken."
      return erb(:signup)
    end

    if repo.email_exists?(params[:email].downcase)
      @error_msg = "That email address is already registered."
      return erb(:signup)
    end

    if params[:password] != params[:confirm_password]
      @error_msg = "Sorry, the passwords entered did not match."
      return erb(:signup)
    end

    user = User.new
    user.username = params[:username].downcase
    user.name = params[:name]
    user.email = params[:email].downcase
    user.password = params[:password]

    repo.create(user)

    session[:username] = user.username
    session[:user_id] = user.id
    redirect '/'
  end

  get '/login' do
    logged_in?
    @title = "Chitter - Log in to Chitter"
    return erb(:login)
  end

  post '/login' do
    if invalid_login_request_parameters?
      status 400
      return ''
    end

    repo = UserRepository.new
    user = repo.find(params[:email])

    if user && BCrypt::Password.new(user.password) == params[:password]
      session[:username] = user.username
      session[:user_id] = user.id
      redirect '/'
    else
      @error_msg = "The email or password entered is incorrect."
      return erb(:login)
    end
  end

  get '/logout' do
    session.destroy
    redirect "/"
  end

  def logged_in?
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