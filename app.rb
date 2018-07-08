require 'sinatra'
require './lib/blab.rb'
require './database_connection_setup'

class Blabber < Sinatra::Base
  get '/' do
    @blabs = Blab.all
    erb :index
  end

  post '/blabs' do
    Blab.create(params[:content])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
