require 'sinatra/base'
require 'sinatra/reloader'
require './database_connection_setup'
require 'uri'

class ChitterApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Hello Peeps!"
  end 

  run! if app_file == $0
end