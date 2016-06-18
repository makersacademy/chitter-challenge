ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './modles/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Chitter!'
  end

  get '/user/signup' do
    erb :sign_up
  end

  post '/user' do
    user = User.create(first_name: params[:first_name],
                surname: params[:surname],
                username: params[:username],
                email: params[:email],
                password: params[:password])
    session[:user_id] = user.id
    redirect to('/welcome')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/welcome' do
    @username = session[:username]
    erb :welcome
  end

  run! if app_file == $0
end
