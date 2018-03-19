require './lib/database_connection'
# db = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
db = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'd5dvkeooapmp51'

DatabaseConnection.connect(db)
