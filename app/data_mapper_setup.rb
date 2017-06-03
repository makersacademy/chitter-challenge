require 'data_mapper'
require 'dm-postgres-adapter'
# set all String properties to have a default length of 255
DataMapper::Property::String.length(255)

require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize
DataMapper.auto_upgrade!
