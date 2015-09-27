require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/models/peep'
require './lib/models/user'


DataMapper.finalize

DataMapper.auto_upgrade!
