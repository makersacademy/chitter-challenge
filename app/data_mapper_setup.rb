require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'
require_relative 'models/post'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||
  "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize


# heroku run rake db:auto_upgrade