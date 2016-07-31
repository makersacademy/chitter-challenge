ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'pry'
require 'database_cleaner'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  set :public_folder, 'public'
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/session/new' do
    erb :'session/new'
  end

  post '/session/new' do
    user = User.create(name: params[:name], username: params[:username],
                    password: params[:password], email: params[:email],
                    password_confirm: params[:password_confirm])
    user.save
    session[:user_id] = user.id
    redirect '/'
  end

  get '/session' do
    erb :'session/index'
  end

  post '/session/create' do
    user = User.authenticate(username: params[:username], password:
                             params[:password])
    if user
      session[:user_id] = user.id
      redirect '/'
    else
      flash.keep[:error] = 'The email or password is incorrect'
      redirect '/session'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
    def active_page?(path='/')
      request.path_info == path
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
