require 'sinatra/base'
require_relative 'database_connection_setup'
require './lib/user'

class Chitter < Sinatra::Base
  get '/' do
    'Hello World'
  end

  run! if app_file == $PROGRAM_NAME
end
