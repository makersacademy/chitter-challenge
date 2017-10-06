require 'data_mapper'
require 'dm-postgres-adapter'

require_relative '../models/message'
require_relative '../models/user'

# mighty-lake-47923
# rackup to start server
ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
