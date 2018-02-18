require 'pg'

task :populate do

  p "reset and repopulate database"

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE users CASCADE;")

  connection.exec("INSERT INTO users VALUES(1, 'Noel');")
  connection.exec("INSERT INTO peeps VALUES(1, 1, 'first peep');")
  connection.exec("INSERT INTO users VALUES(2, 'Ines');")
  connection.exec("INSERT INTO peeps VALUES(2, 2, 'second peep');")
  connection.exec("INSERT INTO users VALUES(3, 'Ruben');")
  connection.exec("INSERT INTO peeps VALUES(3, 3, 'third peep');")
  connection.exec("INSERT INTO users VALUES(4, 'Cassius');")
  connection.exec("INSERT INTO peeps VALUES(4, 4, 'fourth peep');")
  connection.exec("INSERT INTO peeps VALUES(5, 1, 'fifth peep');")
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
