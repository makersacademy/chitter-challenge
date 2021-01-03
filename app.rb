require "sinatra/base"
require "./database_connection_setup"

class Chitter < Sinatra::Base
  enable :sessions

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
    erb :'peeps/new'
  end

  get "/users/new" do
    erb :'users/new'
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password], name: params[:name], user_name: params[:user_name])
    session[:user_id] = user.id
    redirect "/peeps"
  end

  # establish server if file run directly
  run! if app_file == $0
end
