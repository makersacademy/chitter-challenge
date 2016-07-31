ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/user/sign_up' do
    @user = User.new
    erb :'user/sign_up'
  end

  post '/user' do
    @user = User.new(name: params[:name],
                 username: params[:username],
                    email: params[:email],
                 password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect('/user')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'user/sign_up'
    end
  end

  get '/user' do
    erb :'user/user'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
