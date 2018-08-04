def setup_test_database
  connection = PG.connect(dbname: 'chitter_test')

  #clear the bookmarks table
  connection.exec("TRUNCATE peeps;")
end

def enter_test_peeps
  Peep.add("Marek", "This is my first peep!")
  Peep.add("Ed", "Test peep number one")
  Peep.add("Yoda", "Powerful you have become, the dark side I sense in you.")
end
