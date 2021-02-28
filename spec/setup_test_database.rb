require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE tags, peeps, peep_tags, users;")
  connection.exec("INSERT INTO users VALUES (1,'Anonymous', 'anon', '', '', '');")
end
