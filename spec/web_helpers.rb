require_relative '../models/peep'

def add_peeps
  connection = PG.connect :dbname => 'peeps_test_manager'

  connection.exec "INSERT INTO peeps (message, creator) VALUES ('This is my first peep!', 'USER_1');"
  connection.exec "INSERT INTO peeps (message, creator) VALUES ('This is my second peep!', 'USER_2');"
  connection.exec "INSERT INTO peeps (message, creator) VALUES ('This is my third peep!', 'USER_3');"
end