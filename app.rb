require 'sinatra/base'
require 'pg'
require './lib/user'

class Chitter < Sinatra::Base
  enable :sessions

  get '/users' do
    @users = User.all
    erb :'/users/index'
  end

  get '/users/sign_up' do
    erb :'/users/sign_up'
  end

  post '/users' do
    name = params[:user_name]
    password = params[:password]
    email = params[:email]
    @user = User.create(user_name: name, password: password, email: email)
    session[:user_id] = user.id
    redirect 'users'
  end

  run! if app_file == $0
end
