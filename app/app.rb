ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require './app/dmconfig.rb'

class ChitterChallenge < Sinatra::Base
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
    redirect '/users/new'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:user_email],
      password: params[:user_password],
      password_confirmation: params[:password_confirmation],
      name: params[:name],
      username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:user_password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:errors] = ['Email and/or password are incorrect']
      erb :'/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash.keep[:notice] = "Goodbye!"
    redirect to '/peeps'
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
