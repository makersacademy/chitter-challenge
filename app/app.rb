require 'sinatra/base'
require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'secret'

  get '/' do
    'Hello Chitter!'
  end

  get '/user/new' do
    erb :'user/new'
  end

  post '/user' do
    user = User.create(name: params[:name],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect('/welcome')
  end

  get '/welcome' do
    erb :welcome
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
