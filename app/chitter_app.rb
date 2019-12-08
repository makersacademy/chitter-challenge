require 'sinatra/base'
require './lib/user'
require './lib/peep'
require './db/database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/chitter/home' do
    erb :'chitter/index'
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  post '/login' do 

  end

  run! if app_file == $0
end