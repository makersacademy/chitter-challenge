ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'data_mapper'
require_relative './models/user'
require_relative './models/data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb(:signup_login)
  end

  post '/' do
    @user = User.first_or_create(name: params[:user_name],
          email: params[:user_email], password: params[:password])
    redirect '/feed'
  end

  get '/feed' do
    @user = User.first
    erb(:feed)
  end
end
