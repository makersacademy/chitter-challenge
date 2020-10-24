require 'sinatra/base'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    'Hello Chitter'
  end

  run! if app_file == $0
end
