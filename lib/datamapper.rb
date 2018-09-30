require 'data_mapper'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end
