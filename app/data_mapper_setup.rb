require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

require_relative './models/peep.rb'
require_relative './models/user.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
