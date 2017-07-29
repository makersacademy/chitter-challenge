require 'data_mapper'
require 'dm-postgres-adapter'

# require_relative 'models/tag'
# require_relative 'models/link'
# require_relative 'models/user'

#Setting up a connection with a database
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
