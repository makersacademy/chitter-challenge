require 'sinatra/base'
require_relative './lib/chitter_connection_setup'

class Chitter < Sinatra::Base

  get '/homepage' do
    @peeps_channel = Peep.channel
  end

end
