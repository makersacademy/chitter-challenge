require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
end