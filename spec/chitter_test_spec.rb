require 'pg'

def chitter_test_spec.rb

  connection = PG.connect(dbname: 'chitter_test_spec')
  connection.exec('TRUNCATE chitter_peeps;')
end