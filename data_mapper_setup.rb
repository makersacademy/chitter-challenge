

if ENV['ENVIRONMENT'] == 'test'
  database_connection = 'postgres://localhost/chitter_test'
  action = :auto_migrate!
elsif ENV['ENVIRONMENT'] == 'production'
  database_connection = ENV['DATABASE_URL']
  action = :auto_upgrade!
else
  database_connection = 'postgres://localhost/chitter'
  action = :auto_upgrade!
end

DataMapper.setup(:default, database_connection)

DataMapper.finalize
DataMapper.send(action)