require 'sinatra/base'
require 'pg'
require './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    'Testing infrastructure working!'
  end

  run if app_file == $PROGRAM_NAME
end
