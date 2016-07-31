require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/reply'

#don't forget to require relatives in models/
#removed remote ENV['DATABASE_URL'] ||
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
