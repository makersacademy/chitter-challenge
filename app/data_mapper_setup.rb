env = ENV['RACK_ENV'] || 'development'
# checks for current environment from

require 'data_mapper' # get datamapper gem
require 'dm-postgres-adapter'
require 'dm-validations'
require 'dm-timestamps'

# tells DataMapper where the databse is on your machine
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/chitter_#{env}')

# DataMapper::Logger.new($stdout, :debug) # to debug - see postgres
# DataMapper.setup(:default, "postgres://localhost/chitter")

require './app/models/post'
require './app/models/user'
# get application code that will require each model individually - the path may vary depending on your file structure

DataMapper.finalize # finalizes models

DataMapper.auto_upgrade!
# DataMapper.auto_migrate!
