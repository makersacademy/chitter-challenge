require 'data_mapper'

if ENV['environment'] == 'test'
  # DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  # If this is active, I'd need to use rescue blocks
  # whenever I use the ORM
  DataMapper::Model.raise_on_save_failure = false
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end
