require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup(dbname: 'blahblah_test')
elsif ENV['RACK_ENV'] == 'development'
  DatabaseConnection.setup(dbname: 'blahblah')
elsif ENV['RACK_ENV'] == 'production'
  db_url = ENV['DATABASE_URL']
  DatabaseConnection.setup(db_url)
end
