require 'sinatra/base'
require 'sinatra/reloader'
require "time"
require "bcrypt"
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'
require_relative 'lib/user'

DatabaseConnection.connect

class Application < Sinatra::Base 

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  # ------------------
  # HOMEPAGE
  # ------------------
  
  get '/' do
    @peep_repo = PeepRepository.new
    @user_repo = UserRepository.new
    @message = session.delete(:message)

    session_is_open?

    @peep_owner = lambda do |user_id| 
      @user_repo.find_by_id(user_id).username
    end
    
    @peeps = @peep_repo.all
    return @peeps.empty? ? erb(:no_peeps) : erb(:index)
  end

  def session_is_open?
    @session_is_open = !session[:username].nil?
    if @session_is_open
      @user = @user_repo.find(session[:username])
    end
  end

  # ------------------
  # FIND USER BEHAVIOR
  # ------------------

  post "/find_user" do
    repo = UserRepository.new
    search = params[:search]
    @user = repo.find(search)
    session[:message] = "user not found"
    redirect "/" if @user == "not found"
    redirect "/user/#{@user.username}"
  end
  get "/user/:username" do
    username = params[:username]
    repo = UserRepository.new
    @user = repo.find(username)
    return erb(:user_public_page)
  end
  get "/user_not_found" do
    return erb(:user_not_found)
  end

  # ------------------
  # SIGNUP BEHAVIOR
  # ------------------

  get "/signup" do
    @message = session.delete(:message)
    return erb(:signup)
  end
  post "/signup" do
    repo = UserRepository.new
    user = User.new
    user.fullname = params[:fullname]
    user.username = params[:username]
    user.email = params[:email]
    user.password = params[:password]
    @new_user = repo.create(user)

    if @new_user == "already exists"
      session[:message] = "This user already exist. Please login."
      redirect "/signup"
    elsif @new_user == "is successfully registered"
      session[:username] = user.username
      redirect "/"
    end
  end

  # ------------------
  # LOGIN BEHAVIOR
  # ------------------

  get '/login' do
    @message = session.delete(:message) || "Enter your email address and password"
    return erb(:login)
  end

  post '/login' do
    email = params[:email]
    password = params[:password]

    repo = UserRepository.new
    user = repo.login(email, password)
    if user == nil
      session[:message] = "This email address does not exist. Please sign up."
      redirect "/login"
    elsif user == "incorrect password"
      session[:message] = "Password incorrect"
      redirect "/login"
    else
      session[:username] = user.username
      redirect "/"
    end
  end

  get "/logout" do
    session[:username] = nil
    redirect "/"
  end

  # ------------------
  # EDIT USER PROFILE BEHAVIOR
  # ------------------

  get "/:username" do
    user_repo = UserRepository.new
    @user = user_repo.find(params[:username])
    return erb(:private_profile)
  end

  get "/:username/edit_profile" do
    user_repo = UserRepository.new
    @user = user_repo.find(params[:username])
    # p @user
    return erb(:edit_profile)
  end

  get "/:username/edit_profile/:attribute" do
    @username = params[:username]
    @attribute_name = params[:attribute]
    # p @username
    # p @attribute_name
    return erb(:update_attribute)
  end

  post "/:username/edit_profile/:attribute" do
    update_data_process(params)
    p @user.id
    user_repo = UserRepository.new
    @username = user_repo.find_by_id(@user.id).username
    session[:username] = @username

    redirect "/#{@username}/edit_profile"
  end

  def update_data_process(params)
    user_repo = UserRepository.new
    @attribute_name = params[:attribute]
    @new_attribute_value = params[:new_value]
    @user = user_repo.find(params[:username])
 
    method_args = sql_query_provider_for_update_method(@attribute_name, @new_attribute_value, @user.id)
    user_repo.update(method_args[0], method_args[1])
  end

  def sql_query_provider_for_update_method(attribute_name, new_value, user_id)
    case attribute_name
    when "username"
      sql = 'UPDATE users SET username = $1 WHERE id = $2;'
      sql_params = [new_value, @user.id]
    when "email"
      sql = 'UPDATE users SET email = $1 WHERE id = $2;'
      sql_params = [new_value, @user.id]
    end
    return [sql, sql_params]
  end

  # ------------------
  # CREATE NEW PEEP BEHAVIOR
  # ------------------

  post "/new_peep" do
    user = UserRepository.new
    peep_repo = PeepRepository.new
    peep = Peep.new
    peep.time = Time.now
    peep.content = params[:content]
    peep.user_id = user.find(session[:username]).id
    peep_repo.create(peep)
    redirect "/"
  end

  # ------------------
  # EDIT PEEP BEHAVIOR
  # ------------------

  get "/edit_peep/:id" do
    peep_repo = PeepRepository.new
    @peep = peep_repo.find(params[:id]) 
    return erb(:edit_peep)
  end

  post "/edit_peep/:id" do
    peep_repo = PeepRepository.new
    peep = peep_repo.find(params[:id])
    peep.content = params[:content]
    peep_repo.update(peep)
    redirect "/"
  end

end