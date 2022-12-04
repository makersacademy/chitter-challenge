require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/message_repository'
  end

  get '/' do
    return erb(:index)
  end
end

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('chitter_test')

