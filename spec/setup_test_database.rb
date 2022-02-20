require 'pg'

p "Setting up test database..."

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  # Clear the users and peeps tables (because users.id is a foreign key on peeps it will remove applicable rows there too)
  connection.exec("TRUNCATE TABLE users CASCADE;")
  # connection.exec("TRUNCATE peeps, users;")
end
