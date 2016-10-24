ENV['RACK_ENV'] ||= "development"

require 'sinatra/base'
require_relative "models/data_mapper_setup"

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'bottlenose dolphin'

  database_setup

  get "/" do
    erb :index
  end

  get "/users/new" do
    erb :'users/new'
  end

  post "/users" do
    user = User.create(username: params[:username],
                       name: params[:name],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:confirm_password])
    session[:user_id] = user.id
    redirect "/"
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
