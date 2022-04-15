require 'pg'

def wipe_tables
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE peeps;")
  # connection.exec("TRUNCATE users;")
end

def add_three_peeps
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("INSERT INTO peeps (content) VALUES ('Chitter is cool!');")
  connection.exec("INSERT INTO peeps (content) VALUES ('An interesting message..');")
  connection.exec("INSERT INTO peeps (content) VALUES ('Blah blah blah');")
end