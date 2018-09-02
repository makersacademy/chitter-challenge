require 'pg'

def connect_database
  @conn = PG.connect( dbname: 'chitter_test')
end

def truncate_test_database
  connect_database
  @conn.exec( "TRUNCATE peeps" )
end

def fill_test_database
  connect_database
  @conn.exec("INSERT INTO peeps (text) 
              VALUES ('First peep'), ('Second peep'), ('Third peep')")
end
