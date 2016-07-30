ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
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
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/newuser' do
    user = User.create(email: params[:email],
    password: params[:password],
    name: params[:name],
    username: params[:username])
    session[:user_id] = user.id
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
