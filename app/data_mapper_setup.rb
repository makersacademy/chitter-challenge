require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/comment'
require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!

#"postgres://postgres:password@localhost/chitter_db_
#"postgres://localhost/chitter_db_#
#chitter_db_test
#chitter_db_development
