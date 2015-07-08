require 'data_mapper'
require 'dm-postgres-adapter'
# require File.join(File.dirname(__FILE__), '..', './app/models/*.rb')
require './app/models/user.rb'
require './app/models/peep.rb'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
