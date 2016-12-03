ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require "./app/models/user"
require_relative "datamapper_setup"

class Chitter < Sinatra::Base
  get '/users/new' do
    erb(:sign_up)
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
