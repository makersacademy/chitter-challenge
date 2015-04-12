require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './user'
require_relative './peep'

DataMapper.finalize

# When/where to upgrade vs. migrate?
DataMapper.auto_migrate!
