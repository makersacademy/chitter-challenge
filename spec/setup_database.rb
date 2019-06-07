require 'pg'

p 'Setting up the database...'

def setup_database
  connection = PG.connect(dbname: 'chitter')
  connection.exec('TRUNCATE peeps;')
  # connection.exec('TRUNCATE userdetails;')
end
