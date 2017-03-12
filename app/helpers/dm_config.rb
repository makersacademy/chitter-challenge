require 'data_mapper'
require 'dm-postgres-adapter'

#require_relative (model files when created)

def setup
  DataMapper.setup(:default, "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")
  DataMapper.auto_upgrade!
  DataMapper.finalize
end

setup
