ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:homepage)
  end

  get '/sign_up' do
    erb(:sign_up)
  end

  post '/create_user' do
    user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])
    session[:user_id] = user.id
    redirect ('/home')
  end

  get '/home' do
    erb(:home)
  end


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
