require 'pg'
task :say_hello do
  p "Hello World!"
end

task :setup do
  p "Creating database..."

    ['chitter_db', 'chitter_db_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE makers(id SERIAL PRIMARY KEY, name VARCHAR(60), email VARCHAR(60), password VARCHAR(140));")
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message_content VARCHAR(60), maker_id INTEGER REFERENCES makers (id));")
    connection.exec("ALTER TABLE peeps ADD COLUMN created_at TIMESTAMP DEFAULT NOW()")
  end
end
