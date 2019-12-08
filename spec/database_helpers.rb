def db_connection
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'chitter_test')
  else
    PG.connect(dbname: 'chitter')
  end
end
