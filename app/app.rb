ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'something'

  get "/signup" do
    erb :"/signup"
  end

  post "/user/new" do
    user = User.create(user_name: params[:user_name],
                       name: params[:name],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation],
                       email: params[:email])
    session[:user_id] = user.id
    if user.created?
      redirect "/main"
    else
      redirect "/signup"
    end
  end

  get "/main" do
    @user = User.get(session[:user_id])
    erb :"/main"
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
