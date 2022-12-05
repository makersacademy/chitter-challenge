# file: app.rb
require "sinatra"
require "sinatra/reloader"
require_relative "lib/database_connection"
require_relative "lib/peep_repository"
require_relative "lib/user_repository"

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/peep_repository"
    also_reload "lib/user_repository"
  end

  enable :sessions

  get "/" do
    peep_repo = PeepRepository.new
    @peeps = peep_repo.all.reverse
    @user_repo = UserRepository.new
    @message = session.delete(:message)

    return erb(:index)
  end

  post "/login" do
    user = check_login(params[:username], params[:password])

    if user.nil?
      session[:message] = "Email or Password incorrect."
      redirect "/"
    else
      session[:user] = user
      redirect "/"
    end
  end

  post "/logout" do
    session.delete(:user)
    session[:message] = "Logged out successfully."
    redirect "/"
  end

  post "/create_peep" do
    peep_repo = PeepRepository.new

    new_peep = Peep.new
    new_peep.content = params[:content]
    new_peep.time_posted = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    new_peep.user_id = session[:user].id

    peep_repo.create(new_peep)

    redirect "/"
  end

  get "/signup" do
    @message = session.delete(:message)

    return erb(:signup)
  end

  post "/signup" do
    user_repo = UserRepository.new

    check_sign_up(user_repo, params[:email], params[:username])

    new_user = User.new
    new_user.name = params[:name]
    new_user.username = params[:username]
    new_user.email = params[:email]
    new_user.password = params[:password]
    user_repo.create(new_user)

    created_user = user_repo.find_by_email(params[:email])
    session[:user] = created_user
    session[:message] = "Sign up successful."

    redirect "/"
  end

  private

  def check_login(username, password)
    user_repo = UserRepository.new
    user = user_repo.find_by_username(username)

    if user.nil? || BCrypt::Password.new(user.password) != password
      return nil
    end

    return user
  end

  def check_sign_up(repo, email, username)
    if !repo.find_by_email(email).nil?
      session[:message] = "Email already registered."
      redirect "/signup"
    end

    if !repo.find_by_username(username).nil?
      session[:message] = "Username already taken."
      redirect "/signup"
    end

    if username.match(/\W/)
      session[:message] = "Invalid username, please use only numbers, letters and underscore."
      redirect "/signup"
    end
  end
end
