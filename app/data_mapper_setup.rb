require 'data_mapper'
require 'dm-postgres-adapter'

# require_relative 'models/poop'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/shtter_development")
DataMapper.finalize
DataMapper.auto_upgrade!


# #{ENV['RACK_ENV']}
