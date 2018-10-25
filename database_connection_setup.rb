require './lib/database_connection'

DATABASES = {
  'test' => 'chitter_test',
  'development' => 'chitter'
}

database = DATABASES[ENV['ENVIRONMENT']]

DatabaseConnection.setup(database)
