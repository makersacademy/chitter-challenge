require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'tag'
require_relative 'link'
require_relative 'user'



DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://mvivlzerbshyri:xWz6KudjQVFr_EJkG434pYmZZF@ec2-54-225-100-236.compute-1.amazonaws.com:5432/d6uuhd81p6seae")
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
