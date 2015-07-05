require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")


require 'dm-validations'
require './app/models/user'
require './app/models/peep'
require './app/models/comment'
require 'dm-timestamps'


DataMapper.auto_upgrade!

DataMapper.finalize
