def add_test_cheet
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("INSERT INTO cheets (cheet) VALUES ('First cheet');")
end

def clear_test_db
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE cheets")
end
