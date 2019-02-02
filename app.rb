require 'sinatra/base'
require './lib/user'
require_relative './database_connection_setup.rb'

class Chitter < Sinatra::Base
  set :bind, '0.0.0.0'

  database_setup

  get '/' do
    erb :index
  end

  get '/login' do
    erb :login
  end

  get '/signup' do
    erb :signup
  end

  get '/signup/success' do
    User.signup(firstname: params[:firstname], username: params[:username], password: params[:password], display_pic: params[:display_pic], email: params[:email])
    @firstname = params[:firstname]
    erb :signupsuccess
  end


run! if app_file == $0
end
