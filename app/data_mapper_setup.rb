require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

require_relative 'models/maker'
require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] ||  "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
if ENV['RACK_ENV'] == 'test'
   DataMapper.auto_migrate!
end
