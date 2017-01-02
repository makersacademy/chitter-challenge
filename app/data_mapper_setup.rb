require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './models/user'

def setup
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_manager_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
