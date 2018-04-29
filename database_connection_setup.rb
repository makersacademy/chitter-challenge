require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup(dbname: 'blahblah_test')
elsif ENV['RACK_ENV'] == 'development'
  DatabaseConnection.setup(dbname: 'blahblah')
elsif ENV['RACK_ENV'] == 'production'
  DatabaseConnection.setup(ENV['DATABASE_URL'])
end
