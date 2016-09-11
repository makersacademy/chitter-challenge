ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup'

class Chitter < Sinatra::Base
  register

  get '/' do
    @user = $user
    erb :'/users/index'
  end

  get '/users/new' do
    erb :'/users/new'
  end

  post '/users' do
    $user = User.create(name: params[:name], handle: params[:handle], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    @user = $user
    erb :'/users/welcome'
  end

  get '/users/log-in' do
    erb :'/users/log_in'
  end


end
