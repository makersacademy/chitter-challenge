require "data_mapper"
require "dm-postgres-adapter"

require_relative "models/tags"
require_relative "models/link"
# require_relative "models/user"

require 'pry'

# ENV['RACK_ENV'] = 'test'
# binding.pry
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_development#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
