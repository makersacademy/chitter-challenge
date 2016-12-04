ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative 'models/user.rb'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
   def current_user
     @current_user ||= User.get(session[:user_id])
   end
  end

  get '/users/sign-up' do
    @user = User.new
    erb :sign_up
  end

  post '/users' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/chitter')
    else
      flash.now[:notice] = 'password and confirmation do not match'
      erb :sign_up
    end
  end

  get '/chitter' do
    erb :chitter
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
