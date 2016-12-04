ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative './app/models/user.rb'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/signup' do
    # @user = User.create(email: params[:email], password: params[:password])
    erb(:signup)
  end

  post '/' do
    # @user = User.create(email: params[:email], password: params[:password])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
