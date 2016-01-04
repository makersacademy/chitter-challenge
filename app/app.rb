ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require_relative 'models/user'
require_relative 'models/message'
require 'pry'
require 'bcrypt'
require 'dm-timestamps'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  use Rack::MethodOverride


  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
      @user = User.create( email: params[:email],
                          password: params[:password],
                          password_confirmation: params[:password_confirmation],
                          name: params[:name],
                          username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/' do
    if current_user
      redirect to ('/messages')
    else
      redirect to ('/users/new')
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
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = 'goodbye!'
    redirect to '/'
  end

  get '/messages' do
    @messages = Message.all
    erb :'messages/index'
  end

  get '/messages/new' do
    erb :'messages/new'
  end

  post '/messages' do
    if current_user != nil
      Message.create( peep: params[:peep],
                      name: current_user.name,
                      username: current_user.username,
                      posted_at: Time.now.strftime("%Y-%m-%d %H:%M:%S") )
      redirect to('/messages')
    else
      redirect to('/users/new')
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
