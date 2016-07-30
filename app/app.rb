ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get "/signup" do
    erb :"/signup"
  end

  post "/user/new" do
    user = User.create(user_name: params[:user_name],
                       name: params[:name],
                       password: params[:password],
                       email: params[:email])
    session[:user_id] = user.id
    redirect "/main"
  end

  get "/main" do
    @user = User.get(session[:user_id])
    erb :"/main"
  end

  run! if app_file == $0
end
