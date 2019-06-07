
if ENV['ENVIRONMENT'] == 'test'
  database_connection = 'postgres://localhost/chitter_test'
else
  database_connection = 'postgres://localhost/chitter'
end

DataMapper.setup(:default, database_connection)
DataMapper.finalize
DataMapper.auto_upgrade!
