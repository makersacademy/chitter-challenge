require 'pg'

task :test_database_setup do
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query(
    'TRUNCATE users, peeps, tags, peep_tags;;'
  )
end

task :create_databases do
  %w[chitter_production chitter_test].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
  end
end

task :create_tables do
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec(
    "CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR( 60 ), username VARCHAR( 60 ), email VARCHAR( 60 ), password VARCHAR( 120 ));"
  )

  connection.exec(
    "CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR( 240 ), user_id INTEGER REFERENCES users (id), timestamp TIMESTAMP, likes INTEGER);"
  )

  connection.exec("CREATE TABLE tags(id SERIAL PRIMARY KEY, text VARCHAR( 60 ));")

  connection.exec("ALTER TABLE tags ADD CONSTRAINT UC_Tag UNIQUE(text);")

  connection.exec("CREATE TABLE peep_tags (id SERIAL PRIMARY KEY, peep_id INTEGER REFERENCES peeps (id), tag_id INTEGER REFERENCES tags (id));")
end