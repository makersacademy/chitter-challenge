ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
# require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/flash'
require_relative 'models/user'


class Chitter_challenge < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end
  end

  get '/home' do
    erb :home
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.create(email: params[:email],
                  password: params[:password],
                  password_confirmation: params[:password_confirmation])
      if @user.save
        session[:user_id] = @user.id
        redirect to('/home')
      else
        flash.now[:errors] = @user.errors.full_messages
        erb :signup
      end
  end

  get '/login' do
    erb :login
  end

  post 'login' do
    user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        redirect to('/home')
      else
        flash.now[:errors] = ['The email or password is incorrect']
        erb :login
      end
  end

  delete '/login' do
    session[:user_id] = nil
    # flash.keep[:notice] = 'goodbye'
    redirect to('/login')
  end

  get '/post_tweet' do
    erb :post_tweet  
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

end
