require "sinatra/base"
require "./lib/peep"
require "./lib/user"
require_relative "./setup_of_db"

class ChitterChatter < Sinatra::Base

  enable :sessions, :method_override
  # what should it say?
  set :session_secret, "My session secret"

  get "/" do
    User.create("Anonymous", "me@email.com", "1112")
    (session[:id]).nil? ? @user_by_id = User.find("me@email.com") : @user_by_id = User.find_by_id(session[:id])
    @all_peeps = Peep.all
    @all_users = User.all
    erb :main
  end

  get "/new-peep" do
    erb :adding_peeps
  end

  post "/add" do
    (session[:id]).nil? ? @user_by_id = User.find("me@email.com") : @user_by_id = User.find_by_id(session[:id])
    Peep.create(params[:peep], @user_by_id.id)
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
