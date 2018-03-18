require './lib/database_connection'
require './lib/peep'
require './lib/user'

dbname = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
DatabaseConnection.setup(dbname)
Peep.setup
User.setup
