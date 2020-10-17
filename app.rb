require './lib/database_setup'
require 'rack'
require 'sinatra/base'
require './lib/peep'
require './lib/formats'


class Chitter < Sinatra::Base
  get '/chitter' do
    @peeps = Peep.all
    erb :chitter
  end
end
