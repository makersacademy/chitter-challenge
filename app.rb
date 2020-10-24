require 'sinatra/base'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    Maker.create(email: params[:email], password: params[:password], name: params[:name])
    redirect '/'
  end

  run! if app_file == $0
end
