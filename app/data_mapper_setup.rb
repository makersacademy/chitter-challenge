require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-types'

require_relative './model/tag'
require_relative './model/link'
require_relative './model/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
