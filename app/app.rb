require 'sinatra/base'
require 'sinatra/flash'

ENV['RACK_ENV'] ||= 'development'

require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/signup' do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/profile')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :signup
    end
  end

  get '/signin' do
    erb :signin
  end

  post '/signin' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/profile')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :signin
    end
  end

  get '/profile' do
    erb :profile
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
