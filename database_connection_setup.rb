if ENV['ENVIRONMENT'] == 'test'
  connection = PG.connect(dbname: 'chitter_test')
else
  connection = PG.connect(dbname: 'chitter')
end
