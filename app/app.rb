ENV["RACK_ENV"] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'models/user'

class Chitter < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/users' do
    User.create(name: params[:name], username: params[:username], email: params[:email],
    password: params[:password])
  end

  get '/user/new' do
    erb :sign_up
  end

  run! if app_file == $0
end
