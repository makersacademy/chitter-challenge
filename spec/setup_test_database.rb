require 'pg'

def setup_test_database
  p 'putting the DB in DeadBeat.....'

  connection = PG.connect(dbname: 'Chitter_test')

  connection.exec("TRUNCATE peep;")
end
