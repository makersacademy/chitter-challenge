CREATE DATABASE peeps;
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    author VARCHAR(60)
);
CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  link_id INTEGER REFERENCES users(id),
  peep VARCHAR(144)
);

require 'pg'

task :populate do

  p "reset and repopulate database"

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE users CASCADE;")


  # connection.prepare('insert user into user table', "INSERT INTO users(author) VALUES ($1)")
  # connection.exec_prepared('insert user into user table',['Cat'])
  #
  # connection.prepare('user in user table', "SELECT * FROM users WHERE author = ($1)")
  # result = connection.exec_prepared('user in user table',['Cat'])
  # author = result.map { |user| user['author'] }
  #
  # connection.prepare('insert peep into peep table', "INSERT INTO peeps(user_id, peep) VALUES ($1, $2)")
  # connection.exec_prepared('insert peep into peep table',[user_id, peep])
  connection.exec("ALTER SEQUENCE reports_something_seq RESTART 100;")

  connection.exec("INSERT INTO users (author) VALUES ('Noel');")
  connection.exec("INSERT INTO peeps (user_id, peep) VALUES('first peep');")
  connection.exec("INSERT INTO users (author) VALUES ('Ines');")
  connection.exec("INSERT INTO peeps (user_id, peep) VALUES('second peep');")
  connection.exec("INSERT INTO users (author) VALUES ('Ruben');")
  connection.exec("INSERT INTO peeps (user_id, peep) VALUES('third peep');")
  connection.exec("INSERT INTO users (author) VALUES ('Cassius');")
  connection.exec("INSERT INTO peeps (user_id, peep) VALUES(4, 'fourth peep');")
  connection.exec("INSERT INTO peeps (user_id, peep) VALUES(1, 'fifth peep');")
end

task :setup do
  p "Creating databases"

  ["chitter_test", "chitter"].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database}")
    connection.exec("CREATE DATABASE #{database}")
    connection = PG.connect(dbname: "#{database}")
    connection.exec("CREATE TABLE users (id SERIAL PRIMARY KEY, author VARCHAR(60));")
    connection.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users(id), peep VARCHAR(144));")
  end
end

# When we run this Rake task on a machine without bookmark_manager or
# bookmark_manager_test databases, it will create them for us.

# If we run this script on a machine that already has one of these databases,
# it fails. Can you adjust the script to handle the case of one or both
# databases already existing?
