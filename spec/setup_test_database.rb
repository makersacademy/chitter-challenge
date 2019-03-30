require 'pg'
require './lib/peep.rb'

def test_setup
  connection = PG.connect(dbname: 'chitter_test')
  
  connection.exec("TRUNCATE peeps;")
end
