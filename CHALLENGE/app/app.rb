ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/homepage'
  end

  get '/homepage' do
    erb :homepage
  end

  get '/sign_up' do
    erb :sign_up
  end

  get '/login' do
    erb :user_login
  end

  post '/new_user' do
    user = User.create(username: params['Username'],
                       email:    params['E-mail'],
                       password: params['Password'])
    session[:user_id] = user.id
    redirect '/login'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
