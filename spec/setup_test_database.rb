require 'pg'
p "setting up database"
def setup_test_database
  connection = PG.connect(dbname:'diary_manager_test')
  connection.exec("TRUNCATE diary;")
end


