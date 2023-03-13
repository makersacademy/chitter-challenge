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
    @message = _get_session_message
    @peeps = _peep_repo.all

    get_user_for_session
    get_peep_owner_method

    return erb(:index)
  end

  def get_user_for_session
    @session_is_open = !session[:username].nil?
    if @session_is_open
      @user = _user_repo.find(session[:username])
    end
  end
  def get_peep_owner_method
    @peep_owner = lambda do |user_id| 
      _user_repo.find_by_id(user_id).username
    end
  end

  # ------------------
  # FIND USER BEHAVIOR
  # ------------------

  post "/find_user" do
    search = params[:search]
    @user = _user_repo.find(search)

    if @user == "not found"
      session[:message] = "user not found"
      redirect "/"
    else
      redirect "/user/#{@user.username}"
    end
  end

  get "/user/:username" do
    username = params[:username]
    @user = _user_repo.find(username)

    return erb(:public_profile)
  end

  # ------------------
  # SIGNUP BEHAVIOR
  # ------------------

  get "/signup" do
    @message = _get_session_message
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
    user_repo = UserRepository.new
    username = params[:username]
    user = user_repo.find(username)

    current_password = params[:current_password]
    new_password = params[:new_password]
    update_status = user_repo.update_password(user, current_password, new_password)

    if update_status == "Current password incorrect"
      session[:message] = update_status
      redirect "/#{username}/new_password"
    elsif update_status == "Password successfully updated"
      session[:message] = update_status
      redirect "/#{username}/edit_profile"
    end
  end



  # ----------------------------
  # CREATE, EDIT AND DELETE PEEP
  # ----------------------------
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

  get "/delete_peep/:id" do
    peep_repo = PeepRepository.new
    @peep = peep_repo.find(params[:id])
    return erb(:delete_peep)
  end

  post "/delete_peep/:id" do
    p params
    peep_repo = PeepRepository.new
    peep = peep_repo.find(params[:id])
    delete_confirmation = params[:confirmation_answer]

    peep_repo.delete(peep.id) if delete_confirmation = "Yes"

    redirect "/"
  end

  # --------------
  # DELETE ACCOUNT
  # --------------
  get "/:username/delete_account" do
    @message = session.delete(:message)
    @username = params[:username]
    return erb(:delete_account)
  end

  post "/:username/delete_account" do
    confirmation = params[:confirmation]
    password = params[:password]
    username = params[:username]

    user_repo = UserRepository.new
    user = user_repo.find(username)

    deletion_confirmed = confirmation == "confirm delete account"
    password_correct = BCrypt::Password.new(user.password) == password

    if deletion_confirmed && password_correct
      user_repo.delete(user.id)
      session[:username] = nil
      redirect "/"
    else
      session[:message] = "Sorry, something went wrong."
      redirect "/#{username}/delete_account"
    end
  end

  private 

  def _user_repo
    @user_repo ||= UserRepository.new
  end
  def _peep_repo
    @peep_repo ||= PeepRepository.new
  end

  def _get_session_message
    session.delete(:message)
  end
end