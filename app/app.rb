RACK_ENV ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'


  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('users/welcome')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  get '/users/welcome' do
    erb :'users/welcome'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
