require 'pg'

def connect_and_clear_db
  connection = PG.connect(dbname:  'chitter_manager_test')
  connection.exec("TRUNCATE messages;")
end