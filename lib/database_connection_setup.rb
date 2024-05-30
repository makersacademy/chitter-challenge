# ./lib/database_connection_setup.rb

require_relative './database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
  puts "testing env"
else
  DatabaseConnection.setup('chitter')
  puts "dev env"
end
