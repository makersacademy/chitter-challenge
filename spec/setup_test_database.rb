require 'pg'

def setup_test_database

  p "Setting up test database..............⏳...👀"

  con = PG.connect(dbname: 'chitter')

# Clear the bookmarks table
  con.exec('TRUNCATE peeps;')

end
