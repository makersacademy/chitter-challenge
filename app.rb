# file: app.rb

require_relative 'lib/database_connection'
require_relative 'lib/user_repository'
require_relative 'lib/peep_repository'


# We need to give the database name to the method `connect`.
DatabaseConnection.connect('chitter_database_test')


# Perform a SQL query on the database and get the result set.
sql = 'SELECT * FROM users;'
result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
result.each do |record|
   
   p record['name'].include?("Rachel")
end

# FOR ROUTE DEVELOPMENT STAGE

# require 'sinatra/base'
# require 'sinatra/reloader'

# class Application < Sinatra::Base
#   # This allows the app code to refresh
#   # without having to restart the server.
#   configure :development do
#     register Sinatra::Reloader
#   end
# end