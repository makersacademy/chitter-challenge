require 'pg'

p 'Setting up test database...'

def reset_database
  connection = PG.connect(dbname: 'chitter_app_test')
  connection.exec("TRUNCATE TABLE chitter;")
end