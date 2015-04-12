require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require './app/lib/tweet'
require './app/lib/user'
require_relative 'helpers/application'
require_relative 'data_mapper_setup'

enable :sessions
set :session_secret, 'secret password'
use Rack::Flash

get '/' do
  @tweets = Tweet.all
  erb :index
end

post '/tweets' do
  message = params['message']
  user = params['user']
  Tweet.create(message: message, user: user)
  redirect to('/')
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation],
                      name: params[:name],
                      username: params[:username])
  if @user.save
    session[:user_id] = @user.id
    redirect to('/')
  else
    flash.now[:errors] = @user.errors.full_messages
    erb :'users/new'
  end
end

get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
  email, password = params[:email], params[:password]
  user = User.authenticate(email, password)
  if user
    session[:user_id] = User.id
    redirect to('/')
  else
    flash[:errors] = ["The email or password is incorrect"]
    erb :'sessions/new'
  end
end
