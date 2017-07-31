require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.setup(:default, "postgres://localhost/chitter_challenge_test")
DataMapper.finalize
DataMapper.auto_upgrade!
