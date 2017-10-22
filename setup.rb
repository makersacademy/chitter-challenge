require 'data_mapper'
require 'dm-postgres-adapter'

#should these be below the Datamapper.setup?
require_relative 'app/models/peep'
require_relative 'app/models/tag'
require_relative 'app/models/user'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
