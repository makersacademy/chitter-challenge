ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/user'
require 'sinatra/flash'
require 'tilt/erb'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  get '/' do
    erb(:'users/new')
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/peeps/index')
    else
      flash.now[:notice] = 'Password and confirmation password do not match'
      erb(:'users/new')
    end
  end

  get '/peeps/index' do
    erb(:'peeps/index')
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end
