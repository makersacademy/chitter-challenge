require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

register Sinatra::Flash

  get '/home' do
    "Hello"
  end

  get '/login' do
    erb :login
  end

  post '/users' do
  @user = User.create(name: params[:name],
    email: params[:email],
    username: params[:username],
    password: params[:password])
  redirect '/home'
  end

end
