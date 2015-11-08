ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :'links/join_login'
  end

  get '/join' do
    erb :'links/join'
  end

  get '/log-in' do
    erb :'links/log_in'
  end

  post '/authentication' do
    user = User.create(username: params[:Username],
                       password: params[:Password],
                       confirm_password: params[:Confirm_password])
    if user.save
      session[:user_id] = user.id
      redirect :'/home'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'links/join'
    end

  end

  get '/home' do
    erb :'links/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
