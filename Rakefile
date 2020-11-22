require 'pg'

task :test_database_setup do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE users, peeps;")
end