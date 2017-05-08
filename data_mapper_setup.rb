require 'data_mapper'
require 'dm-postgres-adapter'

require './app/models/user'
require './app/models/post'

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
