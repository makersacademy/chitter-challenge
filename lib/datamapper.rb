require 'data_mapper'

if ENV['environment'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper::Model.raise_on_save_failure = false
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end
