def select_database
  ENV['ENVIRONMENT'] == 'prod' ? PG.connect(dbname: 'chitter') : PG.connect(dbname: 'chitter_test')
end