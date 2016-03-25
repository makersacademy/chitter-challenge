ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  register Sinatra::Flash
  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect('/users/new')
  end

  get '/home' do
    current_user
    erb(:home)
  end

  get '/users/new' do
    @user = User.new
    erb(:'users/new')
  end

  post '/users' do
    @user = User.create(username: params[:username],
                       email: params[:email],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect('/home')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
