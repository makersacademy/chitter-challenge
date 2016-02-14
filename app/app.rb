ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

require './app/models/user'

class App < Sinatra::Base

  get '/' do
    'Welcome to Chitter!'
  end

  get '/register' do
    erb :'register'
  end

  post 'register' do
    User.create(name: params[:name],
                username: params[:username],
                email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    redirect '/'
  end

 # start the server if ruby file executed directly
  run! if app_file == $0
end
