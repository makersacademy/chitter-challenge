require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'peep_manager_test')

  connection.exec("TRUNCATE bookmarks;")
end