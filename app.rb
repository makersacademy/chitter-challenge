require 'sinatra/base'
require_relative 'models/data_mapper_setup'



class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    #user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to '/users'
  end

  get '/users' do

    erb :users
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
