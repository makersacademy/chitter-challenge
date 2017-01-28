require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Chitter! please go to signup'
  end

  get '/signup' do
    erb :signup_page
  end

  post '/users' do
    user = User.create(user_email: params[:user_email], password: params[:password], user_full_name: params[:user_full_name], user_name: params[:user_name])
    session[:id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    erb :welcome_page
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
