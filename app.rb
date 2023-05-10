require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return 'Hello world'
  end
end
