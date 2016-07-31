require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'database_cleaner'

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
