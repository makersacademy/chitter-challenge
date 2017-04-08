require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    user.save
    session[:user_id] = user.id
    redirect '/feed'
  end

  get '/feed' do
    erb :feed
  end
end
