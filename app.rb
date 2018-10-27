require 'sinatra/base'
require_relative './lib/user.rb'

# Chitter class
class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    @user = User.find(id: session[:user_id])
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users' do
    user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
