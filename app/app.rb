ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base


  get '/' do
    erb :'links/join_login'
  end

  get '/join' do
    erb :'links/join'
  end

  get '/log-in' do
    erb :'links/log_in'
  end

  post '/home' do
    user = User.create(username: params[:Username],
                       password: params[:Password],
                       confirm_password: params[:Confirm_password])
    # p user
    redirect :'/home'
  end

  get '/home' do
    erb :'links/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
