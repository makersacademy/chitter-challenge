require 'sinatra/base'
require_relative './lib/chitter_connection_setup'
require_relative './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    @peeps_channel = Peep.channel
    erb :homepage
  end

end
