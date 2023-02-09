# file: app.rb
require 'sinatra'
require "sinatra/reloader"
require_relative 'lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    # TODO: see what repositories are needed
    also_reload 'lib/tag_repository'
    # also_reload 'lib/artist_repository'
  end

end