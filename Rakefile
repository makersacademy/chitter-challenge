require pg

task :setup do
  p "Creating databases..."

  ['messages', 'messages_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{ database };")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(140));")
    connection.exec("ALTER TABLE messages ADD COLUMN time_stamp VARCHAR(60);")
    connection.exec("ALTER TABLE messages ADD COLUMN first_name VARCHAR(60);")
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, user_name VARCHAR(60), email VARCHAR(60), password VARCHAR(120));")
  end
end