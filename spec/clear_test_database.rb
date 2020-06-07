def clear_table
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec("TRUNCATE TABLE users;")
  conn.exec("TRUNCATE TABLE peeps;")
  conn.exec("TRUNCATE TABLE feed;")
end
