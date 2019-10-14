require_relative './lib/database_connection'
require 'pg'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup(dbname: 'posts_test')
else
  DatabaseConnection.setup(dbname: 'posts')
end
