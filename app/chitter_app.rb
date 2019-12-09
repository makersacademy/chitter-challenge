require 'sinatra/base'
require './lib/user'
require './lib/peep'
require './db/database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/chitter/index'
  end

  get '/chitter/home' do
    "Test"
    erb :'chitter/index'
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  post '/users/new' do
    redirect '/chitter/home'
  end

  run! if app_file == $0
end