require "sinatra"
require "sinatra/reloader"
require_relative "lib/user_repository"
require_relative "lib/peep_repository"
require_relative "lib/database_connection"

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/user_repository"
    also_reload "lib/peep_repository"
  end

  enable :sessions

  get "/" do
    @peeps = PeepRepository.new.all
    @users = UserRepository.new

    if !session[:user_id].nil?
      @user = @users.find_by_id(session[:user_id])
    end

    erb(:index)
  end

  get "/logout" do
    session.delete(:user_id)

    redirect "/"
  end

  get "/post_peep" do
    erb(:post_peep)
  end

  post "/post" do
    peep = Peep.new
    peep.content = params[:content]
    peep.user_id = session[:user_id]

    PeepRepository.new.create(peep)

    redirect "/"
  end

  get "/sign_up" do
    erb(:sign_up)
  end

  get "/login" do
    erb(:login)
  end

  post "/sessions" do
    repo = UserRepository.new

    if repo.authenticate?(params[:email], params[:password])
      @user = repo.find_by_email(params[:email])
      session[:user_id] = @user.user_id
      redirect "/"
    else
      redirect "/login"
      session[:message] = "Your credentials were incorrect."
    end
  end

  post "/success" do
    user = User.new
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.username = params[:username]
    user.password = params[:password]

    @user = UserRepository.new.create(user)
    @user.save

    session[:user_id] = @user.user_id

    erb(:success)
  end

  get "/:username" do
    @username = params[:username]

    @peeps = PeepRepository.new.find_by_username(@username)

    erb(:user)
  end
end
