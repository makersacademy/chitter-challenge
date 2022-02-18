require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')
  # Clear the tables used in the program
  # N.B This will clear peeps due to the foreign key constraint to users
  connection.exec("TRUNCATE TABLE users CASCADE;")
end
