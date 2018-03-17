require './lib/database_connection'

dbname = ENV['ENVIRONMENT'] == 'test' ? 'bookmark_manager_test' : 'bookmark_manager'
DatabaseConnection.setup(dbname)
