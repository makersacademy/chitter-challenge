require 'sinatra/base'
require './app/data_mapper_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/signup' do
    erb :signup
  end

  post '/signup' do
    User.create(username: params[:username],
                       password: params[:password])
  end

  post '/login' do
    redirect :home
  end

  get '/index' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
