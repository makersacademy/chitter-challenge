require 'pg'

p 'Setting up test database...'

def truncate_test_table
  connection = PG.connect dbname: 'chitter_test'
  connection.exec 'TRUNCATE peeps'
end

def populate_table
  connection = PG.connect dbname: 'chitter_test'
  connection.exec "INSERT INTO peeps (message, posted_at) VALUES ('test 1', '#{Time.now}')"
  connection.exec "INSERT INTO peeps (message, posted_at) VALUES ('test 2', '#{Time.now}')"
  connection.exec "INSERT INTO peeps (message, posted_at) VALUES ('test 3', '#{Time.now}')"
end
