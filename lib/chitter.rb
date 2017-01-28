require 'sinatra/base'
require_relative './models/user'
ENV['RACK_ENV'] ||= 'development'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    redirect '/feed'
  end

  get '/feed' do
    erb :'feed/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], name: params[:name], username: params[:username])
    p user
    p user.id
    session[:user_id] = user.id
    redirect to '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
