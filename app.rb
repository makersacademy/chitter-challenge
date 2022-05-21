require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'

class Chitter < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'hello'
  end

end