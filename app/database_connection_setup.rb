require 'active_record'
require 'pg'

if ENV['RACK_ENV'] == 'test'
  ActiveRecord::Base.establish_connection(
      adapter:  'postgresql',
      database: 'chitter_test',
      username: 'postgres',
      password: 'password',
      host:     'localhost'
  )
else
  ActiveRecord::Base.establish_connection(
      adapter:  'postgresql',
      database: 'chitter',
      username: 'postgres',
      password: 'password',
      host:     'localhost'
  )
end
