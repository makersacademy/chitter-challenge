require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'lib/database_connection'
require_relative 'lib/peep_repository'
require_relative 'lib/user_repository'

DatabaseConnection.connect

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/peep_repository'
    also_reload 'lib/user_repository'
  end

  get "/" do
    @peeps = PeepRepository.new.all

    return erb(:index)
  end

end


# We need to give the database name to the method `connect`.
# DatabaseConnection.connect('chitter_test')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title FROM table;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
# result.each do |record|
#   p record
# end