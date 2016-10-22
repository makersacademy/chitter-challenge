require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/comment'

DataMapper.setup(:default, "postgres://postgres:password@localhost/chitter_db_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

#"postgres://localhost/chitter_db_#
#chitter_db_test
#chitter_db_development
