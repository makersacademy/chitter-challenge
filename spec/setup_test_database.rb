require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_manager_test')
  connection.exec("TRUNCATE peeps, tags, peeps_tags, users;")
end
