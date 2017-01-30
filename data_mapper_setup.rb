require 'dm-postgres-adapter'
require_relative 'lib/user'
require_relative 'lib/peep'

# require 'dm-validations'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV["RACK_ENV"]}")
DataMapper.finalize
DataMapper.auto_upgrade!
