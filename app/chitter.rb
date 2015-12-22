ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require './data_mapper_setup'

class Chitter < Sinatra::Base
  enable :sessions

  get '/' do
    'welcome'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users/new' do
    User.create(name: params[:name], username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
