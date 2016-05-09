ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Kwitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
      @kweets = Kweet.all
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation],  name: params[:name],  user_name: params[:user_name])
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
    flash.keep[:notice] = 'Kisses'
    redirect to '/'
  end

  get '/kweet/new' do
    erb :'kweet/new'
  end

  get '/kweet/from_user' do
    @kweets = Kweet.all(:owner => current_user.user_name)
    erb :'kweet/from_user'
  end

  post '/kweet' do
    kweet = Kweet.create(message: params[:message], owner: @current_user.user_name )
    if kweet.save
      redirect to('/')
    else
      flash.now[:errors] = kweet.errors.full_messages
      erb :'kweet/new'
    end
  end



  run! if app_file == $0
end
