require './lib/user'
require_relative 'app'

class UserController < Sinatra::Base 
  enable :sessions

  get '/users/new' do
    erb :"./users/new"
  end

  post '/users' do
    @user = User.create(name: params['name'], username: params['username'], email: params['email'], password: params['password'])
    session[:user_id] = @user.id
    session[:username] = @user.username
    redirect "users/#{@user.id}"
  end

  get '/users/:id' do
    @user = User.find(session[:user_id])
    erb :"./users/show"
  end

end