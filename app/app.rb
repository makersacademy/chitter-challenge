ENV['RACK_ENV'] ||= 'development'

require './app/models/user'
require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/home' do
    User.create(user_name: params[:user_name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    redirect '/home'
  end

  get '/home' do
    erb :home
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
