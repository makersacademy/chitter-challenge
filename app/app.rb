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

  get '/:user' do
    @user = User.first(username: params[:user])
    erb :user_page
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

  post '/peeps' do
    user = User.get(session[:user_id])
    user.peeps << Peep.create(text: params[:peep], added: Time.now)
    user.save
    redirect '/peeps'
  end

  run! if app_file == $0
end
