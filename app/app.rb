ENV["RACK_ENV"] ||= "development"

require 'data_mapper'
require 'sinatra'
require 'sinatra/base'
require 'dm-postgres-adapter'
require_relative '../db/data_mapper_setup'
require_relative '../lib/user'


class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/user/new' do
    erb :"/user/new"
  end

  post '/user/new' do
    user = User.create(
      name: params[:name],
      username: params[:username],
      email: params[:email],
      password: params[:password]
    )
    redirect "/user/#{user.id}"
  end

  get '/user/:user_id' do
    @user = User.get(params[:user_id])
    erb :"/user/home"
  end

  run! if app_file == $0
end
