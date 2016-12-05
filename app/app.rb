ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter_challenge < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  use Rack::MethodOverride

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/' do
    erb :'/index'
  end

  get '/peeps' do
    erb :'/peeps'
  end

  get '/signup' do
    erb :'/signup'
  end

  get '/signin' do
    erb :'/signin'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/signup_new_user' do
    @user = User.create(email: params[:email],
    password: params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to(:'/peeps')
    else
      flash.keep[:errors] = ["Email already exists, please login"]
      redirect to('/signin')
    end
  end

  post '/signin' do
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect to(:'/peeps')
    else
      flash.keep[:errors] = ["Email or password don't match"]
      redirect to('/signin')
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
