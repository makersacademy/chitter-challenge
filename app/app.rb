ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative './data_mapper_setup'

class Chitter < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    redirect('/signup')
  end

  post '/signup' do
    @user = User.create(name: params[:name], username: params[:username],
                       email: params[:email], password: params[:password],
                       password_confirmation: params[:confirm_password])
    if @user.save
      session[:user_id] = @user.id
      redirect '/home'
    else
      flash.now[:signup_error] = 'Passwords do not match.'
      erb(:signup)
    end
  end

  get '/signup' do
    @user = User.new
    erb(:signup)
  end

  get '/home' do
    current_user
    "Welcome to Chitter, #{@user.name}"
  end

  helpers do
    def current_user
      @user ||= User.get(session[:user_id])
    end
  end
end
