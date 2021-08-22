require 'pg'

def setup_test_database

  connection = PG.connect(dbname: "chitter_test")
  connection.exec("TRUNCATE TABLE peeps;")
  connection.exec("INSERT INTO peeps (message) VALUES ('Im a peep!');")
  connection.exec("INSERT INTO peeps (message) VALUES ('Im another different peep!');")

end
