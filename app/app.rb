ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative './data_mapper_setup.rb'
require_relative './models/user.rb'

class Chitter < Sinatra::Base

  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    erb(:index)
  end

  get '/signup' do
    erb(:signup)
  end

  post '/signup' do
    @user = User.create(name: params[:name],
    username: params[:username],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/')
    else
      erb(:index)
    end
  end

  # get '/home' do
  #   @user = User.first(:email)
  #   session[:user_id] = @user.id
  #   erb(:home)
  # end

  # post '/signup' do
  #   @user = User.create(name: params[:name],
  #   username: params[:username],
  #   email: params[:email],
  #   password: params[:password],
  #   password_confirmation: params[:password_confirmation])
  #     if @user.save
  #       session[:user_id] = user.id
  #       redirect to('/')
  #     else
  #       erb(:index)
  #     end
  # end

  get '/signin' do
    erb(:signin)
  end

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
