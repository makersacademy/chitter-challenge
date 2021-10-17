require "sinatra/base"
require "sinatra/reloader"
require "./lib/peep"
require "./lib/user"
require "pg"
require "./database_connection_setup"

class Chitter < Sinatra::Base
  enable :sessions
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    "Welcome to Chitter!"
  end

  get "/chitter" do
    @user = User.find(id: session[:user_id])
    @peeps = Peep.all
    erb :"chitter/index"
  end

  post "/chitter/new" do
    Peep.create(text: params[:peep])
    redirect "/chitter"
  end

  get "/chitter/users/new" do
    erb :"chitter/users/new"
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/chitter"
  end

  get "/chitter/sessions/new" do
    erb :"chitter/sessions/new"
  end

  post "/sessions" do
    user = User.authenticate(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/chitter"
  end

  run! if app_file == $0
end
