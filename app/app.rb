require 'sinatra/base'
require_relative '../lib/peep'

class ChitterApp < Sinatra::Base

  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end
end
