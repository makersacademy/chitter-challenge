ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'tilt/erb'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'models/message'
require_relative 'models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb(:'index')
  end

  get '/messages' do
    @messages = Message.all
    erb(:'messages/index')
  end

  get '/messages/new' do
    erb(:'messages/new')
  end

  post '/messages' do
    Message.create(message: params[:message])
    redirect '/messages'
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(email: params[:email],
                 password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/messages')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/messages')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  helpers do
  def current_user
    @current_user ||= User.get(session[:user_id])
  end
end

  run! if app_file == $0
end
