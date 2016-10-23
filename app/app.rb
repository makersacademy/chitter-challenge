ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Chitter!'
  end

  get '/chitter' do
    erb :'links/index'
  end

  get '/users/new' do
  erb :'users/new'
end

post '/users' do
  user = User.new(user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  if user.save
    session[:user_id] = user.id
    @status = 'match'
    redirect '/chitter'
  else
    redirect '/users/new'
  end
end

get '/sessions/new' do  #sign in
  erb :'sessions/new'
end

post '/sessions' do
user = User.authenticate(params[:email], params[:password])
  if user # user will be signed in with correct credentials
    session[:user_id] = user.id
    redirect to('/links')
  else
    flash.now[:notice] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
