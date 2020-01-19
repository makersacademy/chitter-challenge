# frozen_string_literal: true
require 'sinatra/base'
require './lib/peep'
require './lib/database_connection_setup'

class Chitter < Sinatra::Base
  enable :sessions
  set :session_store, Rack::Session::Pool

  get '/' do
    session[:peeps] = Peep.all
    erb(:peep)
  end

  post '/peep' do
    Peep.create(message: params[:create_message])
    redirect '/'
  end

  run! if app_file == $PROGRAM_NAME
end
