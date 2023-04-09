require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
# require_relative repository classes
# require_relative 'lib/peep_repository' edit later
# require_relative 'lib/user_repository' edit later

DatabaseConnection.connect('chitter_database')

class Application < Sinatra::Base 
  # configure :development do
  #   register Sinatra::Reloader
  #   also_reload 'lib/peep_repository' edit later
  #   also_reload 'lib/user_repository'  edit later
  # end
end
