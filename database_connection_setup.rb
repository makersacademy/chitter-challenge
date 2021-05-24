require './lib/database_connection.rb'

if ENV['ENVIRONMENT'] == 'test'
  con = PG.connect(dbname: 'chitter_test')
else
  con = PG.connect(dbname: 'chitter')
end