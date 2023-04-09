require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
# require_relative repository classes
# require_relative 'lib/album_repository' edit later
# require_relative 'lib/artist_repository' edit later

DatabaseConnection.connect

class Application < Sinatra::Base 
  # configure :development do
  #   register Sinatra::Reloader
  #   also_reload 'lib/album_repository' edit later
  #   also_reload 'lib/artist_repository'  edit later
  # end
end
