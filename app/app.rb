ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'data_mapper'
require_relative './models/user'
require_relative './models/data_mapper_setup'
require 'pry'

class Chitter < Sinatra::Base

  get '/' do
    erb(:signup)
  end

  post '/' do
    @user = User.generate(name: params[:newuser_name], username: params[:newuser_username],
          email: params[:newuser_email], password: params[:newuser_password])
    redirect '/login'
  end

  before do
    @user = User.instance
  end

  get '/login' do
    erb(:login)
  end

  post '/login' do
    redirect '/feed'
  end

  get '/feed' do
    erb(:feed)
  end
end
