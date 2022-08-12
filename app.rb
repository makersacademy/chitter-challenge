require_relative "lib/PostsRepository"
require_relative 'lib/UsersRepository'
require 'sinatra/reloader'
require 'sinatra'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/album_repository'
    also_reload 'lib/artist_repository'
  end
  #routes 

end
