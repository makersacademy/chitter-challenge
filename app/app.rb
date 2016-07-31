ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user'

class Chitter < Sinatra::Base

  enable :sessions

  get '/user/sign_up' do
    erb :'user/sign_up'
  end

  post '/user' do
    User.create(    name: params[:name],
                username: params[:username],
                   email: params[:email],
                password: params[:password])
    redirect('/user')
  end

  get '/user' do
    'Welcome, user'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
