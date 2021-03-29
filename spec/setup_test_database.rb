require 'pg'

def setup_test_database_user
  connection = PG.connect :dbname => 'chitter_test'
  connection.exec("TRUNCATE user;")
end


def setup_test_database_message
  connection = PG.connect :dbname => 'chitter_test'
  connection.exec("TRUNCATE messages;")
end

def setup_test_database_security
  connection = PG.connect :dbname => 'chitter_test'
  connection.exec("TRUNCATE security;")
end
