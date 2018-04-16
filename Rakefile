require 'pg'

task :test_database_setup do
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec "TRUNCATE TABLE users, messages RESTART IDENTITY;"
end
