require './lib/database_connection'
require './lib/peep'

dbname = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
DatabaseConnection.setup(dbname)
Peep.setup
