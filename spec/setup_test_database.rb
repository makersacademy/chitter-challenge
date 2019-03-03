require "pg"

def setup_test_database
  connection = PG.connect(dbname: 'chiter_test')
  connection.exec("TRUNCATE Post;")
end
