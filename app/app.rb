require 'sinatra/base'
require_relative 'models/user'
require_relative 'datamapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/home'
  end

  get '/home' do
    current_user
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end

  post '/home' do
    user = User.create(name: params[:name],
    username: params[:username],
    email: params[:email],
    password_digest: params[:password])
    session[:user_id] = user.id
    user.save
    redirect '/home'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
