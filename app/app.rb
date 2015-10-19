require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user = User.get(session[:user_id])
    end
  end

  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(name: params[:name],
                       username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/sign_up'
    end
  end

  get '/sessions/new' do
    erb :'sessions/sign_in'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])

    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/sign_in'
    end

  end

end
