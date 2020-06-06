require 'pg'

p 'Please hold, cleaning database...'

def refresh_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec( "TRUNCATE TABLE peeps, users;")
end