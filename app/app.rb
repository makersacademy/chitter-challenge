ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name], username: params[:username],
                email: params[:email],  password: params[:password])
    session[:user_id] = user.id
    redirect '/'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
