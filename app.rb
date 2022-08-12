require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
		# also_reload 'lib/...
  end
end

