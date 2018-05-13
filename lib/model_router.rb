require 'data_mapper'
require 'dm-validations'

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, 'postgres://localhost/chitter_test')
else
  DataMapper.setup(:default, 'postgres://localhost/chitter')
end

require 'date'
require_relative 'peep'
require_relative 'user'

DataMapper.finalize
User.auto_upgrade!
