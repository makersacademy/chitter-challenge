ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/bottle'
require_relative 'models/user'
require 'sinatra/flash'

class MessageInABottle < Sinatra::Base
  use Rack::MethodOverride

  set :sessions, true
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    redirect '/stream'
  end

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/user' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation],
                    name: params[:name],
                    username: params[:username])
    if @user.save
      session[:id] = @user.id
      redirect to('bottle/new')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/new'
    end

  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:id] = user.id
      redirect to ('/bottle/new')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    session[:id] = nil
    flash.keep[:notice] = 'Come back whenever you like'
    redirect '/stream'
  end

  get '/bottle/new' do
    unless current_user
      redirect '/user/new'
    end
    erb :'bottle/new'
  end

  post '/message' do
    current_user.bottles.create(message: params[:message], time: Time.now)
    redirect '/stream'
  end

  get '/stream' do
    @bottles = Bottle.reverse_chronological_order
    erb :'/stream/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:id])
    end
  end
end
