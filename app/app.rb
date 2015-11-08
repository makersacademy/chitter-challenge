ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/user'
require 'data_mapper'
require 'dm-postgres-adapter'
#require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :session
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       username: params[:username],
                       name: params[:name])
    session[:user_id] = user.id
    # session[:username] = user.username
    # @username = User.username
    redirect to('/chitter_page')
  end
  get '/chitter_page' do
    @current_user = User.last
    # @username = session[:username]
    erb :chitter_page

  end


  run! if app_file == $0
end
