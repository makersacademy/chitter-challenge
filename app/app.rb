ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/data_mapper_setup'
require 'sinatra/flash'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  get '/' do
    erb :index
  end

  get '/new_user' do
    erb :user_new
  end

  post '/sign_up' do
    user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/links'
    else
    flash.now[:notice] = "Passwords need to match."
    erb :user_new
    end
 end

 get '/links' do
   erb :chitter
 end

 get '/sessions/new' do
   erb :'sessions/new'
 end

 post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user_id] = user.id
    redirect to('/links')
  else
    flash.now[:errors] = ['The email or password is incorrect']
    erb :'sessions/new'
  end
end

 # start the server if ruby file executed directly
   run! if app_file == $0
end
