require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'database_connection_setup'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  run! if app_file == $PROGRAM_NAME
end
