require 'pg'

task :test_database_setup do
  DatabaseConnection.setup('peep_manager_test')
  DatabaseConnection.query(
    'TRUNCATE peeps, users RESTART IDENTITY;'
  )
end

task :create_databases do
  %w[peep_manager peep_manager_test].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
  end
end

task :create_tables do
  connection = PG.connect(dbname: 'peep_manager_test')

  connection.exec(
    "CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(30), username VARCHAR(30), email VARCHAR(60), password VARCHAR(100));"
  )

  connection.exec(
    "CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240), user_id INTEGER REFERENCES users (id), time_created TIME);"
  )
end
