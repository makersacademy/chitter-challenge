require 'dm-validations'
require 'data_mapper'
env = ENV['RACK_ENV'] || "development"
require_relative 'models/user'
require_relative 'models/peep'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!