require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'tag'
require_relative 'link'
require_relative 'user'

if ENV["RACK_ENV"]  == "development"
  ENV["DATABASE_URL"] = "postgres:///chitter_development"
end

DataMapper.setup(:default, ENV['DATABASE_URL'])
DataMapper.finalize
DataMapper.auto_upgrade!
