require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'peep'
require_relative 'user'

if ENV["RACK_ENV"]  == "development"
  ENV["DATABASE_URL"] = "postgres:///chitter_development"
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://mvivlzerbshyri:xWz6KudjQVFr_EJkG434pYmZZF@ec2-54-225-100-236.compute-1.amazonaws.com:5432/d6uuhd81p6seae")
#I know this is wrong - I couldn't get it to work the proper way
DataMapper.finalize
DataMapper.auto_upgrade!
