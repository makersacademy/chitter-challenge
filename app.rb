require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end