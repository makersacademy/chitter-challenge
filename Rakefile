require 'pg'

task :setup_test_database do
  p "Resetting test database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE TABLE users, peeps;")
end
