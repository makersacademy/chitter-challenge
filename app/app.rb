ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :sessions_secret, 'super_secret'
  register Sinatra::Flash

  get '/' do
    'hello world'
  end

  get '/users' do
    # 'users'
    erb :'users/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end 

  post '/users' do
    @user = User.new(email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/users')
    else
      flash.now[:notice] = 'Password and confirmation password do not match'
      erb :'users/new'
    end
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  run! if app_file == $0
end
