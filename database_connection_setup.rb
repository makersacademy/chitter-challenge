require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'lib/peep'
require_relative 'lib/user'
require_relative 'database_connection_setup.rb'

require File.join(File.dirname(__FILE__), 'lib', 'peep.rb')
require File.join(File.dirname(__FILE__), 'lib', 'user.rb')

if ENV['RACK_ENV'] == 'test'
  DataMapper.setup(:default, "postgres:///chitter_test")
else
  DataMapper.setup(:default, "postgres:///chitter")
end
# DataMapper.finalize
# DataMapper.auto_upgrade!
