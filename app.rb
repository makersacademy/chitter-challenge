require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection_setup.rb'

class Chitter < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  run! if app_file == $0
end