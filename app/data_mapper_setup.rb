require 'data_mapper'
require 'dm-postgres-adapter'

# require_relative 'models/tag'
# require_relative 'models/link'
require_relative 'models/users'

# later you'll need to require the models that are using DM to connect to your DB
ENV['RACK_ENV']||= "development"

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/Chitter_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!
