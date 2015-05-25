require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_users_#{env}")

require './lib/user'

DataMapper.finalize

DataMapper.auto_upgrade!