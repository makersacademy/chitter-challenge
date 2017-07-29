require 'data_mapper'
require 'dm-postgres-adapter'
require 'sinatra/base'
require 'sinatra/flash'
require 'dm-core'
require 'dm-timestamps'
require_relative 'models/peep.rb'
require_relative 'models/user.rb'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
