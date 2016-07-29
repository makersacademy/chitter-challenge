require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'

#don't forget to require relatives in models/
#removed remote ENV['DATABASE_URL'] ||
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
