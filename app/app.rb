ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'


class Chitter < Sinatra::Base

   enable :sessions

   get '/users/new' do
    erb :'users/new'
   end

   post '/users/new' do
     user = User.create(name: params[:name], email: params[:email], username: params[:username], password: params[:password])

     session[:id] = user.id
     redirect to('/users/welcome') unless user.id.nil?
     redirect to('/users/registration_failed')
   end

   get '/users/welcome' do
     @user = current_user
     erb :'users/welcome'
   end

  get '/users/registration_failed' do
     erb :'users/registration_failed'
   end

  helpers do
    def current_user
      id = session[:id]
      @current_user ||= User.get(id)
    end
  end

  run! if app_file == $0

end

