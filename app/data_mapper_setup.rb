require 'data_mapper'
require './app/models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||
      "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
