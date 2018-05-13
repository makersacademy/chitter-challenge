require 'data_mapper'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

require 'date'
require_relative 'peep'
require_relative 'router_methods'
require_relative 'user'
require_relative 'view_methods'

DataMapper.finalize
User.auto_upgrade!
