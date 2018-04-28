require './lib/database_connection'

if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('blahblah_test')
elsif ENV['RACK_ENV'] == 'development'
  DatabaseConnection.setup('blahblah')
elsif ENV['RACK_ENV'] == 'production'
  20.times { p "AHHHHHHHHHHHHHHHHHHHHHHHHH REAL MONSTERSSSSS" }
end
