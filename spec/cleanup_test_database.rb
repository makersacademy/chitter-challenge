def cleanup_test_database
  require 'pg'

  p "Cleaning up test database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("SET session_replication_role = 'replica';")
  connection.exec("TRUNCATE peeps RESTART IDENTITY;")
  connection.exec("TRUNCATE users RESTART IDENTITY;")
  connection.exec("SET session_replication_role = 'origin';")
end