require 'pg'

def connect_database
  @conn = PG.connect(dbname: 'chitter_test')
end

def truncate_test_database
  connect_database
  @conn.exec("TRUNCATE peeps")
end

def fill_test_database
  connect_database 
  time_default = Time.now.strftime("%m/%d/%Y")
  @conn.exec( 
              "INSERT INTO peeps (text, time) 
              VALUES ('First peep', '#{time_default}'), 
              ('Second peep', '#{time_default}'), 
              ('Third peep', '#{time_default}')"
            )
end
