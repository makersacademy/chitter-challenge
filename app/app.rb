ENV['RACK_ENV']||= "development"

require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require 'bcrypt'
# require_relative 'models/user'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/home' do
    erb(:home)
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.new(username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/home')
    else
      flash.now[:notice] = "Passwords do not match"
      erb(:'/users/new')
    end
  end





end
