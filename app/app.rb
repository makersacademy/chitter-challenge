ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/signup' do
    erb :signup
  end

  post '/users' do
    @user = User.create(name: params[:name],
                     email: params[:email],
                     username: params[:username],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
