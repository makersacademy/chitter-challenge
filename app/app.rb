ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    @messages = Message.all
    erb :'homepage'
  end

  post '/new' do
    message = Message.new(message: params[:message])
    message.save
    redirect to '/'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
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
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions/new' do
    user = User.authenticate(params[:name], params[:email])
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:notice] = "The email or password is incorrect"
      erb :'sessions/new'
    end
  end

  run! if app_file == $0
end
