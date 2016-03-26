require 'data_mapper'
require 'dm-postgres-adapter'

# require_relative 'link'
# require_relative 'tag'
# require_relative './app.rb'
require_relative './lib/user'
DataMapper.setup(:default,  ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
