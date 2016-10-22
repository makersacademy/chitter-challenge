ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require './models/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect 'users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(user_name: params[:user_name],
    name: params[:name],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/peeps')
  end

  get '/peeps' do
    erb :'/welcome'
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
