require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/chit'
require_relative 'models/sign_in'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
