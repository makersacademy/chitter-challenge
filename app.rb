require "sinatra"
require "sinatra/reloader"
require_relative "lib/database_connection"
#change below
# require_relative "lib/album_repository"
# require_relative "lib/artist_repository"

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    #change below
    # also_reload "lib/album_repository"
    # also_reload "lib/artist_repository"
  end
end
