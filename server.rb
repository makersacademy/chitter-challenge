require 'sinatra'
require 'data_mapper'
require './lib/tweet'
require './lib/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chiter_#{env}")

require './lib/tweet'
require './lib/user'

DataMapper.finalize
DataMapper.auto_upgrade!

enable :sessions
set :session_secret, 'secret password'

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
  erb :'users/new'
end

post '/users' do
  user = User.create(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                     name: params[:name],
                     username: params[:username])
  session[:user_id] = user.id
  redirect to('/')
end

helpers do
  def current_user
    @current_user ||= User.get(session[:user_id]) if session[:user_id]
  end
end
