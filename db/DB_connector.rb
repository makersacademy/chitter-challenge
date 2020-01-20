require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'my_user',
  password: 'p@ssw0rd',
  database: 'my_db'
)
