require 'sinatra/base'
require_relative 'models/user'

ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super secret'

  get '/' do
    "Welcome to Chitter!"
  end

  get '/users/new' do
    erb :'users/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username],
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/sessions/new')
    else
      flash.now[:errors] = ['The username or password is incorrect']
      erb :'sessions/new'
    end
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        password: params[:password],
                        username: params[:username],
                        name: params[:name])
    session[:user_id] = @user.id
    redirect to('/users/new')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
