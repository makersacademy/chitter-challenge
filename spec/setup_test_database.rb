require 'pg'
require 'dotenv'
Dotenv.load

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test', user: "#{ENV['PG_USERNAME']}", password: "#{ENV['PG_PASSWORD']}")
  connection.exec("TRUNCATE tags, peeps, peep_tags, users;")
  connection.exec("INSERT INTO users VALUES (1,'Anonymous', 'anon', '', '', '');")
end
