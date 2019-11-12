require "pg"

def setup_test_database
  connection = PG.connect(dbname: "chitter_test")

  connection.exec("TRUNCATE peeps;")
end

def add_three_peeps
  connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep');")
  connection.exec("INSERT INTO peeps VALUES(2, 'This is another peep');")
  connection.exec("INSERT INTO peeps VALUES(3, 'This is the lucky third peep');")
end
