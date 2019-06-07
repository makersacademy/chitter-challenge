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
    @user_by_id = User.find_by_id(session[:id])
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
    User.create(params[:name], params[:user], params[:pass])
    new_user = User.find(params[:user])
    session[:id] = new_user.id
    redirect "/"
  end

  run! if app_file == $0
end
