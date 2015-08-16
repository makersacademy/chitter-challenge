require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default,
  ENV["DATABASE_URL"] || "postgres://localhost/chitter_#{env}")

require './app/models/user'
require './app/models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!
