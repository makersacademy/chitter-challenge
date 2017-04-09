ENV['RACK_ENV'] = 'development'
require 'sinatra/base'
require 'sinatra/flash'
require_relative '../app/models/user'


class Chitter < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash


  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # get '/users/new' do
  #   erb :'new'
  # end
  #
  # post '/users/new' do
  #   User.create(email: params[:email] ,password: params[:password])
  #   flash.next[:notice] = "Welcome, #{params[:email]}"
  #   redirect '/index'
  # end
  #
  get '/index' do
    erb :'index'
  end

  get '/users/new' do
    @user = User.new
    erb :'new'
  end

  post '/users' do
    @user = User.new(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      flash.next[:new_user] = "Welcome"
      redirect '/index', 303
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'new'
    end
  end

end
