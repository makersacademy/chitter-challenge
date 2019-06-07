require "sinatra/base"
require "./lib/peep"
require "./lib/user"
require_relative "./setup_of_db"

class ChitterChatter < Sinatra::Base

  enable :sessions, :method_override
  # what should it say?
  set :session_secret, "My session secret"

  get "/" do
    @all_peeps = Peep.all
    @user_mail = session[:email]
    erb :main
  end

  get "/new-peep" do
    erb :adding_peeps
  end

  post "/add" do
    Peep.create(params[:peep])
    redirect "/"
  end

  get "/user" do
    erb :adding_users
  end

  post "/add-user" do
    User.create(params[:user], params[:pass])
    session[:email] = params[:user]
    redirect "/"
  end

  run! if app_file == $0
end
