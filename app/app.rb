ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'datamapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  get '/' do
    'Hello Chitter!'
  end

  get '/messages' do
    erb :'messages/index'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.create(name: params[:name], email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password])
    session[:user_id] = @user.id
    redirect '/messages'
  end

helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end
end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
