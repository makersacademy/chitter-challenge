require 'data_mapper'
require 'dm-postgres-adapter'

def data_mapper_config
  DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
