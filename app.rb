require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'
require 'pg'

class Chitter < Sinatra::Base

  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :index
  end

  get '/new' do
    erb :new
  end

end
