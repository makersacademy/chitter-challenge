require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require_relative 'models/user.rb'

# DataMapper.setup(:default, 'postgres://localhost/chitter_development')
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
