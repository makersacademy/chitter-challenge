require 'pg'

task :setup_test_database do
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('TRUNCATE peeps')
end

task :create_databases do
  %w[chitter chitter_test].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
  end
end

task :create_tables do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec(
    "CREATE TABLE peeps (id SERIAL PRIMARY KEY, content VARCHAR(240), user_id INTEGER REFERENCES users (id), time_created TIME);"
  )
  connection.exec(
    "CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(30), email VARCHAR(60), password VARCHAR(100));"
    )
end
