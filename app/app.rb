require 'sinatra/base'
require_relative 'models/db-setup'
require_relative 'models/user'

ENV['RACK_ENV'] ||= 'development'

class App < Sinatra::Base
  enable :sessions
  set :session_secret, 'narcissus'

  helpers do 
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sign-up' do
    erb(:signup)
  end

  post '/users/new' do
    user = User.create(
      username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect('/home')
  end

  get '/home' do
    erb(:home)
  end
end
