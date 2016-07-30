ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './data_mapper_setup.rb'
require './app/models/user'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'



  get '/' do
    erb :index
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
  @user = User.create(
    email: params[:email],
    name: params[:name],
    username: params[:username],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      flash.now[:notice] = "Password and confirmation password do not match"
      erb :'users/new'
    end
  end

  helpers do
 def current_user
   @current_user ||= User.get(session[:user_id])
 end

  end



  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
