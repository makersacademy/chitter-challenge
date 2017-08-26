require 'data_mapper'
require 'dm-postgres-adapter'

require_relative '../models/message'

# mighty-lake-47923
ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
