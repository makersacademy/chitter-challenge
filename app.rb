require 'sinatra/base'
require './lib/peep'
# require './database_connection_setup'

class Chitter < Sinatra::Base

  get '/' do
    @peeps = Peep.all
    erb :index
  end

end