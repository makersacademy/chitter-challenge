ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  post '/login' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.now[:errors] = 'There was a problem with your log in'
      erb :index
    end
  end

  # post '/sessions' do
  #   user = User.authenticate(params[:email], params[:password])
  #   if user
  #     session[:user_id] = user.id
  #     redirect to('/links')
  #   else
  #     flash.now[:errors] = ['The email or password is incorrect']
  #     erb :'sessions/new'
  #   end
  # end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
