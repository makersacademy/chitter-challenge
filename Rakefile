require 'pg'

task :test_database_setup do
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE users;")
  conn.exec("TRUNCATE peeps;")
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    conn = PG.connect
    conn.exec("CREATE DATABASE #{database};")
    conn = PG.connect(dbname: database)
    conn.exec("CREATE TABLE users(first_name VARCHAR, last_name VARCHAR, \
      email VARCHAR UNIQUE, username VARCHAR UNIQUE, password VARCHAR, \
      user_id SERIAL PRIMARY KEY);")
    conn.exec("CREATE TABLE peeps(user_id INT4, content VARCHAR, \
      time TIMESTAMP, post_id SERIAL PRIMARY KEY);")
  end
end
