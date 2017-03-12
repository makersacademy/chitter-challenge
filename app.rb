ENV["RACK_ENV"] ||= 'development'

require './models/helper'
require 'sinatra/base'
require './models/user'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  post '/stored' do
    new_user = User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password])
    session[:user_id] = new_user.id
    session[:username] = new_user.username
    redirect '/logged_in'
  end

  get '/logged_in' do
    @username = session[:username]
    erb :logged_in
  end

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

end
