require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/maker'

DataMapper.setup(:default, "postgres://localhost/chitter_peeps_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
