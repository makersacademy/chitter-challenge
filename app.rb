require './database_connection_setup'
require './lib/peep'
require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  get '/peep/new' do
    erb :write_peep
  end

  post '/peep' do
    Peep.create(text: params[:peep])
    redirect to '/'
  end

end
