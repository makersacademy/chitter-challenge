require 'pg'


def setup_test_database
  p 'Setting up test database...'

  # Set connection with database
  connection = PG.connect(dbname: 'peep_test_manager')

  # Clear the bookmarks table
  connection.exec("TRUNCATE peeps;")
end