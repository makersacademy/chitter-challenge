require 'active_record'

if ENV['RACK_ENV'] == 'test'
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'chitterverse_test'
  )
else
  ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: 'localhost',
    database: 'chitterverse'
  )
end
