ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  enable :partial_underscores

  get '/user/new' do
    @user = User.new
    erb :'user/new'
  end

  post '/user' do
    @user = User.new(full_name: params[:full_name],user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to '/user/start'
    else
      flash.now[:error] = @user.errors.full_messages
      erb :'user/new'
    end
  end

  get '/user/start' do
    erb :'user/start'
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/messages'
    else
      flash.now[:notice] = 'The email or password is incorrect'
      erb :'session/new'
    end
  end

  delete '/session' do
    session[:user_id] = nil
    redirect to '/session/new'
  end

  get '/messages' do
    erb :'messages/index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
