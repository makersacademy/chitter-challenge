require 'pg'

p 'Setting up database...'

def setup_test_database
  connection = PG.connect(dbname: 'chitter')

  connection.exec('TRUNCATE bookmarks;')
end
