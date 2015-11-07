ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setter'

class Chitter < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  set :session_secret, 'super secret'

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/sign-up' do
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name], user_name: params[:user_name])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/index')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'/users/new'
    end
  end

  get '/index' do
    @current_user = User.get(session[:user_id])
    erb :'index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
