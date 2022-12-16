require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/message_repository'
require_relative 'lib/message'
# We need to give the database name to the method `connect`.
DatabaseConnection.connect('chitter_test')

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/message_repository'
  end

  get '/' do
    repo = MessageRepository.new

    @messages = repo.all

    return erb(:index)
  end

  

end



