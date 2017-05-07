ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base

  get '/' do
    erb :homepage
  end
  post '/users' do
    user = User.create(name: params[:name],
                       email: params[:email],
                       user_name: params[:user_name],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/main'
  end

  get '/login' do
    erb :login
  end

  get '/main' do

  end

end
