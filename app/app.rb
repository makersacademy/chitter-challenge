ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base
  
  enable :sessions
  set :session_secret, 'super secret'
  
  get '/' do
    redirect '/main'
  end
  
  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users' do
    user = User.create(email: params['email'],
                password: params['password'],
                name: params['name'],
                username: params['username'])
    session[:user_id] = user.id
    redirect to('/main')
  end
  
  get '/main' do
    erb :main
  end
  
  
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

 
  run! if app_file == $0
end
