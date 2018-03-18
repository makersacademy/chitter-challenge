require './lib/database_connection'
db = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
DatabaseConnection.connect(db)
