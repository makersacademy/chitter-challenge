ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'


class Chitter < Sinatra::Base
  use Rack::MethodOverride
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/messages'
  end

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    message = Message.new(post:params[:post], time:params[:time])
    current_user.messages << message
    message.save
    redirect '/messages'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(password:params[:password], password_confirmation:params[:password_confirmation], email:params[:email], username:params[:username], name:params[:name])
    if @user.save
      redirect '/sessions/new'
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
    if user
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = [['The email or password is incorrect']]
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end

end
