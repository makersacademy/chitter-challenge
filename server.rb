require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/tweet'

DataMapper.finalize

DataMapper.auto_upgrade!
