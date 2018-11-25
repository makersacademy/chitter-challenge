require './lib/cheet'
require 'sinatra/base'
require_relative './database_connection_setup'

class Chitter < Sinatra::Base

  enable :sessions

  get '/' do
    redirect '/cheets'
  end

  get '/cheets' do
    @cheets = Cheet.all
    erb(:"cheets/index")
  end

  run! if app_file == $0
end
