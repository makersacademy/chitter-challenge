require 'dm-postgres-adapter'
require 'data_mapper'

require_relative 'models/signup'
# require_relative 'models/tags'
require_relative 'models/user'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_database_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
