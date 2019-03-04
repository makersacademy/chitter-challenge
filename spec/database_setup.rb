require 'pg'

def clean_database
  conn = PG.connect(dbname: 'chitter_test')
  # conn.exec("TRUNCATE peeps")
  conn.exec("DROP TABLE peeps")
end

p "Setting up test database..."

def build_database
  conn = PG.connect(dbname: 'chitter_test')

  conn.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, timestamp timestamptz NOT NULL DEFAULT now(), peep VARCHAR(140) NOT NULL)")

  conn.exec("INSERT INTO peeps VALUES (DEFAULT, '2019-03-02 10:34:30', 'On Chitter, we post messages called \"Peeps\"')")
  
  conn.exec("INSERT INTO peeps VALUES (DEFAULT, '2019-03-02 10:45:55', 'Homepage shows peeps in reverse chronological order')")
    
   conn.exec("INSERT INTO peeps VALUES (DEFAULT, '2019-03-03 08:52:30', 'The peep at the top of the page is the most recent')")
    
end