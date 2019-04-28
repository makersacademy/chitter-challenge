require 'pg'

def setup_test_database

  p "Setting up test database..."

  connection = PG.connect(dbname: 'peep_database_test')

  #clear the bookmarks table each time
  connection.exec("TRUNCATE peeps;")

end