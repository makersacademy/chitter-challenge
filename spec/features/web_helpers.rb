def add_test_cheets
  conn = PG.connect(dbname: 'chitter_database_test')
  conn.exec("INSERT INTO cheets (cheet) VALUES ('My first cheet'), ('My second cheet');")
end

def clear_test_db
  conn = PG.connect(dbname: 'chitter_database_test')
  conn.exec("TRUNCATE cheets")
end
