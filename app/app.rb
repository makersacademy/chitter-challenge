ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'data_mapper'
require_relative '../models/data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'THIS. IS. CHITTERRR!'
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(username: params[:username],
                           name: params[:name],
                          email: params[:email_address],
                       password: params[:password],
          password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect to('/users/new')
    erb :layout
  end

  get 'users/welcome' do
    erb :'users/welcome'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
