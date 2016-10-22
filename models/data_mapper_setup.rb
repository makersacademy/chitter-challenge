require "data_mapper"
require "dm-postgres-adapter"

def data_mapper_configure
  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "postgres://localhost/chitter_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!
end
