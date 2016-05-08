ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/peeps' do
    erb :'peeps'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(name: params[:name], username: params[:username], email: params[:email],
      password: params[:password], password_confirmation: params[:password_confirmation])
      if @user.valid?
      session[:user_id] = @user.id
      redirect to('/peeps')
    else flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
