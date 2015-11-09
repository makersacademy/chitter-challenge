ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/user'
require 'data_mapper'
require 'dm-postgres-adapter'
#require './app/data_mapper_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  # helpers do
  def current_user
    current_user ||= User.get(session[:user_id])
  end
  # end
  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :new_user
  end

  post '/users' do
    user = User.create(email: params[:email],
                       password: params[:password],
                       username: params[:username],
                       name: params[:name])
    session[:user_id] = user.id
    redirect to('/chitter_page')
  end

  get '/chitter_page' do

    erb :chitter_page

  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/chitter_page'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      redirect '/sessions/new'
    end
  end


  run! if app_file == $0
end
