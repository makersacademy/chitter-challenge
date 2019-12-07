require 'pg'

def clear_database
  p "Cleaning database"
  connection = PG.connect( dbname: 'chitter_test')
  connection.exec('TRUNCATE peeps;')
end
