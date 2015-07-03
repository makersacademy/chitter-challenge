require 'sinatra'
require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb :'users/sign_up'
  end

  post '/users/new' do
    @user = User.create(username: params[:username], name: params[:name], email: params[:email], password: params[:password])
    session[:user_id] = @user.id
    erb :'users/new'
  end

  post '/users' do
    @user = User.first(username: params[:username])
    session[:user_id] = @user.id unless session[:user_id]
    erb :'users/peeps'
  end

  get '/users' do
    @user = current_user
    erb :'users/peeps'
  end

  def current_user
    User.get(session[:user_id])
  end

end
