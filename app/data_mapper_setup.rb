require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

# Every model must be required individually
# require './app/link'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!