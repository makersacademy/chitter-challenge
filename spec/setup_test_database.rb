require "pg"

def setup_test_database
  connection = PG.connect(dbname: 'chitter_app_test')

  # Clear the users and peeps table after the test
  connection.exec("TRUNCATE peeps, users, peeps")
end