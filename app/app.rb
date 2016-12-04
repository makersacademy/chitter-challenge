ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter_challenge < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/index' do
    erb :'/index'
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/signup' do
    User.create(email: params[:email],
    password: params[:password])
    session[:user_id] = user.id
    erb :'/welcome'
  end

  get '/welcome' do
    erb :'/welcome'
  end

  post '/welcome' do

    erb :'/welcome'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
