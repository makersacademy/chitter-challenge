ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'really not so secret'
  register Sinatra::Flash

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

  get '/users/signup' do
    erb :'/users/new'
  end

  # post '/signup' do
  #   redirect '/users'
  # end
  # #
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect to('/homepage')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/homepage'
  end

end
