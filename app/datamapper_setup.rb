require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{env}")

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.finalize

DataMapper.auto_upgrade!