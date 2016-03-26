ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'


require_relative 'data_mapper_setup'
require_relative './models/user'



class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/session')
  end

  get '/session' do
    erb :session
  end

end
