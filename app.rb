require 'sinatra/base'
require './lib/blah'
require './database_connection_setup'

class BlahBlah < Sinatra::Base
  set :sessions, true

  get '/' do
    redirect '/blahs'
  end

  get '/blahs' do
    @blahs = Blah.all
    erb :'blahs/index'
  end

  post '/blahs' do
    Blah.create(params[:blah])
    redirect '/'
  end

  get '/blahs/new' do
    erb :'blahs/new'
  end

  run! if app_file == $0
end
