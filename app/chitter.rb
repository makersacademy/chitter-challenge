ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect('/users/new')
  end

  get '/home' do
    current_user
    erb(:home)
  end

  get '/users/new' do
    erb(:'users/new')
  end

  post '/users' do
    user = User.create(user_name: params[:user_name],
                       email: params[:email],
                       password: params[:password])
    session[:user_id] = user.id
    redirect('/home')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
