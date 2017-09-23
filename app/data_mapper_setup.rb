require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/peep.rb'
require 'sinatra/base'
require 'date'
require 'dm-timestamps'
 require 'dm-validations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
# DataMapper.auto_upgrade!
