require 'data_mapper'
require 'dm-validations'
require 'dm-migrations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative './models/user'
require_relative './models/peep' 


DataMapper.finalize

DataMapper.auto_upgrade!