require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-sqlite-adapter'

require './app/models/maker.rb'

p ENV['RACK_ENV']
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
# DataMapper.auto_upgrade!
DataMapper.auto_migrate!
