require_relative 'users'
require_relative 'peeps'
require 'dm-migrations'

if ENV['ENVIRONMENT'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

DataMapper.finalize
DataMapper.auto_migrate!
