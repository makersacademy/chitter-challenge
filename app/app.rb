ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'sinatra/flash'
require 'data_mapper'
require_relative 'models/user'
require 'pry'
require 'bcrypt'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash


  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
      @user = User.create( email: params[:email],
                          password: params[:password],
                          password_confirmation: params[:password_confirmation],
                          name: params[:name],
                          username: params[:username])
    if @user.save
      session[:user_id] = @user.id
      redirect to ('/')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end

  get '/' do
    @name = session[:name]
    erb :'index'
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

end
