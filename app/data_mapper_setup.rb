require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'


#require_relative 'models/peep'

# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")
#Hopefully I don't need this anymore!!!
#DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://postgres:password@localhost/chitter_challenge_#{ENV['RACK_ENV']}")

#DataMapper.setup(:default, "postgres://localhost/chitter_challenge_test")

DataMapper.setup(:default, "postgres://postgres:password@localhost/chitter_challenge_test")

# DataMapper.finalize
# DataMapper.auto_upgrade!

#chitter_db_test
#chitter_db_development
