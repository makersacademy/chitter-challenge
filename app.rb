require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    "Hello World!"
  end

  run! if app_file == $0
end
