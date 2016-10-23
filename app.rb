ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email],
                password: params[:password])
    session[:user_id] = user_id
    redirect to('/post')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
