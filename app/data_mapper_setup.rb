require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chittr_#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)

if ENV['RACK_ENV'] == 'test'
    DataMapper.auto_migrate!
end

DataMapper.finalize
