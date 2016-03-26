require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require_relative './models/user'
require_relative './models/peep'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

if ENV['RACK_ENV'] == 'test'
   DataMapper.auto_migrate!
end

DataMapper.finalize
