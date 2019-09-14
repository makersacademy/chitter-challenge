require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  host: 'localhost',
  username: 'student',
  database: 'chitter'
)

require './app'

run Chitter
