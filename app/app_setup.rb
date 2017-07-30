require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'dm-validations'
require 'sinatra/base'
require 'date'
require 'bcrypt'

require_relative 'models/peep.rb'
require_relative 'models/user.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
