def clear_tables
  connection = PG.connect(dbname: 'peeps_test')
  connection.exec("TRUNCATE TABLE messages")
end
