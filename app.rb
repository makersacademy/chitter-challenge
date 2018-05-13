require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'



class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all.reverse
    erb :index
  end

  post '/form' do
    Peep.add(params['peep'], params['username'])
    redirect('/')
  end

end
