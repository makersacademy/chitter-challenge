ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class ChitterApp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get "/" do
    erb :"sessions/new"
  end

  post "/sessions" do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to("/peeps")
    else
      flash.now[:errors] = ["The email or password is incorrect"]
      erb :"/sessions/new"
    end
  end

  get "/sessions/new" do
    erb :"/sessions/new"
  end

  get "/users/new" do
    erb :"users/new"
  end

  post "/users" do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to("/peeps")
  end

  get "/peeps" do
    erb :peeps_list
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
