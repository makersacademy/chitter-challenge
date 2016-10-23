require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'peep'
require_relative 'user'



DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://dllxzmrxeodzlk:0NX0zgiJ1YYsIhHW1EG1zElK0l@ec2-23-21-238-76.compute-1.amazonaws.com:5432/d7oursjkjm3qf6)
DataMapper.finalize
DataMapper.auto_upgrade!



#
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres:///chitter_development_#{ENV['RACK_ENV']}")
# DataMapper.finalize
# DataMapper.auto_upgrade!




# if ENV["RACK_ENV"]  == "development"
#   ENV["DATABASE_URL"] = "postgres:///chitter_development"
# end
#
# DataMapper.setup(:default, ENV['DATABASE_URL'])
# DataMapper.finalize
# DataMapper.auto_upgrade!
