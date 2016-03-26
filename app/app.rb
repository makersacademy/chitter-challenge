ENV['RACK_ENV'] ||= 'development'
RACK_ENV = ENV['RACK_ENV']

require 'sinatra/base'
require_relative './models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super_secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :home
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    user = User.create(
      email: params[:email],
      password: params[:password],
      name: params[:name],
      username: params[:username]
    )
      session[:user_id] = user.id
      redirect '/'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:notice] = "email and password is not recognized"
      erb :'sessions/new'
    end
  end



  # start the server if ruby file executed directly
  run! if app_file == $0
end
