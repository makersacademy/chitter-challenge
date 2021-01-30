require 'sinatra'
require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  enable :method_override

  get '/feed' do 
    @peeps = Peep.all
    erb :feed
  end

  post '/feed' do
    Peep.create(message: params[:peep], time_last_altered: Time.now)
    redirect('/feed')
  end

  delete '/feed/:id' do 
    Peep.delete(id: params[:id])
    redirect('/feed')
  end

  run! if app_file == $PROGRAM_NAME
end