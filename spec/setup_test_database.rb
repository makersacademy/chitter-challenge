require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE posts, users, comments RESTART identity;")

end
