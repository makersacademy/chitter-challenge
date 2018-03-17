require './lib/db_connection.rb'

@db_name = (ENV['RACK_ENV'] == 'testing') ? 'phoenix_test' : 'phoenix'
DB_Connection.setup(@db_name)
