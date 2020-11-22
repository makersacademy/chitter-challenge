require 'sinatra/base'
require './lib/peep'
require './lib/user'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    erb :index
  end
end
