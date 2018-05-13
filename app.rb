require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'



class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.new
    erb :index
  end

  post '/form' do
    Peep.new.add(params['peep'], params['username'])
    redirect('/')
  end

end
