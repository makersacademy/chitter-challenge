ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require './app/data_mapper_config'
require_relative './models/peep'
require_relative './models/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'something'
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  get '/peeps' do
    @peeps = Peep.all.reverse
    erb :peeps
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash.now[:login_error] = 'The email or password is incorrect'
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    flash[:goodbye] = current_user.username
    session[:user_id] = nil
    redirect '/peeps'
  end

  get '/users/recover' do
    erb :'users/recover'
  end

  post '/users/recover' do
    user = User.first(email: params[:email])
    if user
      user.generate_token
    end
    erb :'users/acknowledgment'
  end

  get '/users/reset_password' do
    @user = User.find_by_valid_token(params[:token])
    if @user
      session[:token] = params[:token]
      erb :'users/reset_password'
    else
      "Your token is invalid"
    end
  end

  get '/:user' do
    @user = User.first(username: params[:user])
    if @user
      erb :user_page
    else
      erb :user_not_found
    end
  end

  post '/users' do
    @user = User.new(
      username: params[:username],
      email: params[:email],
      name: params[:name],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      @user.errors.each { |error| flash.now[:password_mismatch] = error[0] }
      erb :'users/new'
    end
  end

  patch '/users' do
    user = User.find_by_valid_token(session[:token])
    if user.update(password: params[:password], password_confirmation: params[:password_confirmation])
      session[:token] = nil
      user.update(password_token: nil)
      redirect '/sessions/new'
    else
      flash.now[:errors] = user.errors.full_messages
      erb :'users/reset_password'
    end
  end

  post '/peeps' do
    user = User.get(session[:user_id])
    user.peeps << Peep.create(text: params[:peep], added: Time.now)
    user.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
