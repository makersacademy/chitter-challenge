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
    @peeps = @peep_repo.all
    get_connected_user
    get_peep_owner_function
    return @peeps.empty? ? erb(:no_peeps) : erb(:index)
  end

  def get_connected_user
    @session_is_open = !session[:username].nil?
    if @session_is_open
      @user = @user_repo.find(session[:username])
    end
  end
  def get_peep_owner_function
    @peep_owner = lambda do |user_id| 
      @user_repo.find_by_id(user_id).username
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
  # USER PRIVATE PAGE
  # ------------------

  get "/:username" do
    user_repo = UserRepository.new
    @user = user_repo.find(params[:username])
    return erb(:private_profile)
  end

  get "/:username/edit_profile" do
    user_repo = UserRepository.new
    @user = user_repo.find(params[:username])
    @message = session.delete(:message)
    return erb(:edit_profile)
  end

  # ----------------------
  # USER UPDATE ATTRIBUTE PAGE
  # ----------------------

  get "/:username/edit_profile/:attribute" do
    @username = params[:username]
    @attribute_name = params[:attribute]
    @message = session.delete(:message)

    return erb(:update_attribute)
  end

  post "/:username/edit_profile/:attribute" do
    process = update_data_process(params)
    fallback_process if process == "failed"

    @username = @user_repo.find_by_id(@user_id).username
    session[:username] = @username
    redirect "/#{@username}/edit_profile"
  end

  def update_data_process(params)
    return "failed" if check_availability_for(params[:new_value]) == "not available"
    
    @user_id = @user_repo.find(params[:username]).id
    update_args = get_args_for_sql_query(params[:attribute], params[:new_value], @user_id)
    @user_repo.update(update_args[0], update_args[1])
  end

  def check_availability_for(new_value)
    @user_repo = UserRepository.new
    return @user_repo.find(new_value) == "not found" ? "available" : "not available"
  end

  def get_args_for_sql_query(attribute_name, new_value, user_id)
    case attribute_name
    when "username"
      sql = 'UPDATE users SET username = $1 WHERE id = $2;'
    when "email"
      sql = 'UPDATE users SET email = $1 WHERE id = $2;'
    end
    sql_params = [new_value, @user_id]
    return [sql, sql_params]
  end

  def fallback_process
    session[:message] = "This #{params[:attribute]} is not available"
    @username = params[:username]
    @attribute = params[:attribute]
    redirect "/#{@username}/edit_profile/#{@attribute}"
  end


  # ------------------
  # UPDATE PASSWORD
  # ------------------

  get "/:username/new_password" do
    @username = params[:username]
    @message = session.delete(:message)
    return erb(:new_password)
  end

  post "/:username/new_password" do
    p params
    user_repo = UserRepository.new
    username = params[:username]
    user = user_repo.find(username)
    p username
    p user
    current_password = params[:current_password]
    new_password = params[:new_password]
    update_status = user_repo.update_password(user, current_password, new_password)
    p update_status
    if update_status == "Current password incorrect"
      session[:message] = update_status
      redirect "/#{username}/new_password"
    elsif update_status == "Password successfully updated"
      session[:message] = update_status
      redirect "/#{username}/edit_profile"
    end
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