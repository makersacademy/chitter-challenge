ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  get '/homepage' do
    @homepage = Homepage.all
    erb :'homepage/index'
  end

  get '/homepage/new_message' do
    erb :'/homepage/new_message'
  end

  post '/homepage' do
     Homepage.create(message: params[:message])
    redirect '/homepage'
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    redirect '/users/users'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    session[:user_id] = User.id
    redirect to('/homepage')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
