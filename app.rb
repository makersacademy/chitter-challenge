require 'sinatra/base'
require './lib/database/database_connection_setup'

class ChitterApp < Sinatra::Base
  get '/' do
    "Hello World"
  end
end
