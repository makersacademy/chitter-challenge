require 'data_mapper'
require 'rack-flash'
require 'sinatra'

require_relative 'data_mapper_setup'

require './app/models/peep'
require './app/models/user'
require './app/helpers/helpers'

enable :sessions
set :session_secret, 'super secret'
set :public_folder, 'public'
use Rack::Flash

get '/' do
  prepare_public_feed
  erb :index
end

get '/about' do
  erb :about
end

get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.create(email: params[:email],
                      password: params[:password],
                      password_confirmation: params[:password_confirmation],
                      name: params[:name],
                      username: params[:username])
  if @user.save
    session[:id] = @user.id
    flash[:notice] = 'Registration confirmed'
    redirect '/'
  else
    flash.now[:error] = @user.errors.full_messages
    erb :signup
  end
end

post '/login' do
  username, password = params[:username], params[:password]
  user = User.authenticate(username, password)
  if user
    session[:id] = user.id
    redirect to '/main'
  else
    flash[:error] = 'The username or password was incorrect'
    redirect to '/'
  end
end

get '/main' do
  user = User.get(session[:id])
  if user.nil?
    flash[:error] = 'Please login first'
    redirect to '/'
  end
  @name = user.name
  prepare_public_feed
  erb :mainpage
end

post '/main' do
  user = User.get(session[:id])
  create_peep(user.name, 'public')
  prepare_public_feed
  erb :mainpage
end

post '/main/private/message' do
  user = User.get(session[:id])
  prepare_private_feed(user.name, params[:maker])
  erb :private_peep
end

post '/main/private' do
  user = User.get(session[:id])
  create_peep(user.name, params[:receiver])
  prepare_private_feed(user.name, params[:receiver])
  erb :private_peep
end

delete '/session' do
  flash[:notice] = 'Goodbye!'
  session[:id] = nil
  redirect to '/'
end