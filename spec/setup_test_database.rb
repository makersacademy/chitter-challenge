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
  time_default = Time.now.strftime("%H:%M%p")
  date_default = Time.now.strftime("%m/%d/%Y")
  @conn.exec( 
              "INSERT INTO peeps (text, time, date) 
              VALUES ('Peep1', '#{time_default}', '#{date_default}'), 
              ('Peep2', '#{time_default}', '#{date_default}'), 
              ('Peep3', '#{time_default}', '#{date_default}')"
            )
end
