require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/tag'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
puts "SUP #{ENV['RACK_ENV']} SUP" #show current database. connecting to dev even with no reference. black magic?
DataMapper.finalize
