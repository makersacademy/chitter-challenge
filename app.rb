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

  get '/cheets/new' do
    erb(:"cheets/new")
  end

  post '/cheets/new' do
    Cheet.create(content: params[:content])
    redirect('/cheets')
  end

  run! if app_file == $0
end
