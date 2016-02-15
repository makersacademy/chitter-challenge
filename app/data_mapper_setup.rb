# app/data_mapper_setup.rb
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
