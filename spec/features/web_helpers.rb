def add_test_peep
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("INSERT INTO peeps (peep) VALUES ('First peep');")
end

def clear_test_db
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE peep")
end
