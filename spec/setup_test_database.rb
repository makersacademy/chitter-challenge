require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps, users;")
  connection.exec("INSERT INTO users (id, first_name, last_name, email, password, username)
    VALUES('100', 'Fay', 'Jones', 'fj@mail.com', 'secret', 'FayJ')")
end
