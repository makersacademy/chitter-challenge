require './lib/database_connection'

p 'Establishing Connection'

if ENV['RACK_ENV'] == 'test'
  dbname = 'chitter_test'
else
  dbname = 'chitter'
end

DatabaseConnection.setup(dbname)

p "Connected to #{dbname}"
