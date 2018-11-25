require 'sinatra/base'
require './database_connection_setup'
require './lib/peep'

class Chitter < Sinatra::Base

  get '/' do
    'Welcome to Chitter'
  end

  run! if app_file == $0
end
