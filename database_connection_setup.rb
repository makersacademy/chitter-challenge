require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  PG.connect(dbname: 'Chitter_Manager_test')
else
  PG.connect(dbname: 'Chitter_Manager')
end
