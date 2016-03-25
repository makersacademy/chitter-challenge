ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter!'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     confirmation: params[:confirmation])
  end

  run! if app_file == $PROGRAM_NAME
end
