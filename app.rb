require "sinatra/flash"
require "sinatra/base"
require "./database_connection_setup"

class Chitter < Sinatra::Base
  enable :sessions

  register Sinatra::Flash

  get "/" do
    redirect "/peeps"
  end

  get "/peeps" do
    @user = User.find(session[:user_id]) if session[:user_id]
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post "/peeps" do
    Peep.create(message: params[:message], user_id: session[:user_id])
    redirect "/peeps"
  end

  get "/peeps/new" do
    @user = User.find(session[:user_id])

    if @user
      erb :'peeps/new'
    else
      flash[:notice] = "Please sign or log in to Peep"
      redirect "/peeps"
    end
  end

  get "/users/new" do
    erb :'users/new'
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    session[:user_id] = user.id
    redirect "/peeps"
  end

  get "/sessions/new" do
    erb :'sessions/new'
  end

  post "/sessions" do
    user = User.authenticate(email: params[:email], password: params[:password])

    if user
      session[:user_id] = user.id
      redirect "/peeps"
    else
      flash[:notice] = "Incorrect email or password"
      redirect "/sessions/new"
    end
  end

  post "/sessions/destroy" do
    session.clear
    flash[:notice] = "You have logged out"
    redirect "/peeps"
  end

  # establish server if file run directly
  run! if app_file == $0
end
