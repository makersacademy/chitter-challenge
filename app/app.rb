ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  post '/' do
    erb :home
  end

  get '/user/new' do
    @user = User.new
    erb :'user/sign_up'
  end

  post '/user' do
    @user = User.new(name: params[:name],
                 username: params[:username],
                    email: params[:email],
                 password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect('/user')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/sign_up'
    end
  end

  get '/user' do
    erb :'user/user'
  end

  get '/sessions/new' do
    erb :'sessions/log_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect('/')
    else
      flash.now[:errors] = ['The email or password you have entered is incorrect']
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
