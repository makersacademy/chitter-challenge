require 'pg'
def setup_test_database
  connection = PG.connect(dbname: 'my_peeps_test')
  connection.exec("TRUNCATE peeps;")
end
