require 'data_mapper'
require 'dm-timestamps'
require 'dm-validations'

require_relative 'models/user'
require_relative 'models/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
