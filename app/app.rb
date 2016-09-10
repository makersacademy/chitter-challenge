ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    redirect '/users/new'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create(name: params[:name],
                 email: params[:email],
                 username: params[:username],
                 password: params[:password],
                 password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:errors] = user.errors.full_messages
      flash[:name] = params[:name]
      flash[:email] = params[:email]
      flash[:username] = params[:username]
      redirect '/users/new'
    end
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect '/peeps'
    else
      flash[:failed_login] = 'Sorry, incorrect email or password'
      redirect '/sessions/new'
    end
  end

  get '/peeps' do
    erb :'peeps/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
