require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Chitter < Sinatra::Base

  enable :sessions

  set :session_secret, 'super secret'


  def current_user
    User.get(session[:user_id])
  end

  get '/' do
    erb :'index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email:    params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    session[:user_id] = user.id
    redirect to('/sessions/new')
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
