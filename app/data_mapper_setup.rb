require 'data_mapper'
require 'dm-validations'
require 'dm-timestamps'


env = ENV['RACK_ENV'] || 'development'

# we're telling datamapper to use a postgres database on localhost. The name will be "bookmark_manager_test" or "bookmark_manager_development" depending on the environment
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")


require './app/models/user'
require './app/models/peep'


DataMapper.finalize

DataMapper.auto_upgrade!
