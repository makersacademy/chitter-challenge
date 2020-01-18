require 'sinatra/base'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter!'
  end

  get '/chitter' do
    erb(:index)
  end

  post '/chitter/new' do
    session[:peep] = params[:peep]
  end

  run! if app_file == $0
end