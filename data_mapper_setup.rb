
if ENV['ENVIRONMENT'] == 'test'
  database_connection = 'postgres://localhost/chitter_test'
  action = :auto_migrate!
else
  database_connection = 'postgres://localhost/chitter'
  action = :auto_upgrade!
end

DataMapper.setup(:default, database_connection)
DataMapper.finalize
DataMapper.send(action)