require './lib/db_connection'

dbname = (ENV['DATABASE'] == 'test' ? 'chitter_test' : 'chitter')
DBConnection.setup(dbname)
