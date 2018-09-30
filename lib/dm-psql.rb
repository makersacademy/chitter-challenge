require 'data_mapper'
require_relative 'user'
require_relative 'peep'

DB_USER = 'jon'

if ENV['ENVIRONMENT'] == 'test'
  DATABASE_URL = "postgres://#{DB_USER}@localhost/chitter_test"
else
  DATABASE_URL = "postgres://#{DB_USER}@localhost/chitter"
end

DataMapper.setup(:default, DATABASE_URL)

DataMapper.finalize

User.auto_upgrade!
Peep.auto_upgrade!
