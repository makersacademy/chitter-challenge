require './lib/database_connection'

db = ENV['RACK_ENV'] == 'test' ? 'chitter_test' : 'chitter'
DatabaseConnection.setup(db)
