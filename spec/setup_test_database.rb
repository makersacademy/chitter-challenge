require 'pg'

p "Setting up database..."

def setup_test_database
  connection = PG.connect(dbname: 'travis_ci_test')
  connection.exec("TRUNCATE posts;")
  connection.exec("TRUNCATE users;")
end
