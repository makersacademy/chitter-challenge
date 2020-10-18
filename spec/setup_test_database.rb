require 'pg'

def truncate_test_db
  connection = PG.connect(dbname: 'chitter_test')
#clear bookmarks table
  connection.exec("TRUNCATE peeps;")
end
