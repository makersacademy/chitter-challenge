ENV['RACK_ENV'] ||='development'

require 'sinatra/base'
require './app/database_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/sign-up' do
      erb :'users/sign-up'

  end

  post '/users' do
    user = User.create[name: [:name], email: params[:email], user_name: [:user_name],
    password: params[:password]]
    session[:user_id] = user.id
    redirect '/welcome'
  end

  get '/welcome' do
    erb :'welcome'
  end

  run! if app_file == $0

end
