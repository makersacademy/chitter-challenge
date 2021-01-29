require 'sinatra'
require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/feed' do 
    @peeps = Peep.all
    erb :feed
  end

  post '/feed' do
    p params
    Peep.create(message: params[:peep])
    redirect('/feed')
  end

  run! if app_file == $PROGRAM_NAME
end