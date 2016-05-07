require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'data_mapper_setup'

ENV["RACK_ENV"] ||= "development"

class Chitter < Sinatra::Base
  enable :sessions

  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  #Sign in
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  #sign up
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
      password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:error] = 'Password and confirmation password do not match'
      erb :'users/new'
    end
  end

  #user's homepage
  get '/peeps' do
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
