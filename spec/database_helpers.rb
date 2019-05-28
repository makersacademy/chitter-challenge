def clear_database
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec('TRUNCATE peep, account;')
  p '...setting up database...'
end
