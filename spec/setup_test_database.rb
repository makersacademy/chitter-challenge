require 'pg'

def setup_test_database
  p "Setting up test database..."

  connection = PG.connect(dbname: 'test_chitter')

  connection.exec("DROP TABLE peeps;")
  connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, name VARCHAR(60), text VARCHAR(120), created_at TIMESTAMP DEFAULT NOW());")
end