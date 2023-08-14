# file: lib/database_connection.rb
require 'active_record'

def establish_database_connection
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    port: '5432',
    database: 'chitter_test',
  )
end
