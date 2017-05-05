ENV["RACK_ENV"] = "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    user = User.create(name: params[:name], username: params[:username],email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/posts')
  end

  get '/posts' do
    @user = session[:user_id]
    erb :'posts/index'
  end

end
