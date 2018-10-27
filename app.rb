require './database_connection_setup'
require './lib/peep'
require 'sinatra'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

end
