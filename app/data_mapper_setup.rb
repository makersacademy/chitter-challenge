require 'data_mapper'
require 'dm-validations'
require './app/models/user'
require './app/models/peep'
require './app/models/reply'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
