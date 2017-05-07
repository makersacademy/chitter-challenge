ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'data_mapper'
require_relative './models/user'
require_relative './models/data_mapper_setup'
require 'pry'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:signup)
  end

  post '/' do
    @user = User.create(name: params[:newuser_name], username: params[:newuser_username],
          email: params[:newuser_email], password: params[:newuser_password])
    session[:id] = @user[:id]
    redirect '/login'
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    session[:username] = params[:user_name]
    session[:password] = params[:user_password]
    @user = User.find { session[:id] }
    redirect '/feed'
  end

  get '/feed' do
    @user = User.find { session[:id] }
    erb(:feed)
  end

  get '/logout' do
    session.clear
    redirect '/login'
  end
end
