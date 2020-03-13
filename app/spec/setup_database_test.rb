require 'pg'
# this is called everytime we run our tests so we clear our test database environment
def setup_test_database
    connection = PG.connect(dbname: 'chitter_test')
  # this clears the tables
    connection.exec("TRUNCATE messages, users;")
end
