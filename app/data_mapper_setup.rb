require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/user'
require_relative 'models/tag'
require_relative 'models/reply'

require 'dotenv'
Dotenv.load

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.auto_upgrade!
DataMapper.finalize
