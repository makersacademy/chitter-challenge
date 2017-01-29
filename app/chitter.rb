ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
    @current_user = User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], user_name: params[:user_name],email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    session[:user_id] = @user.id
    redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:user_name],params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
      session[:user_id] = nil
      redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
