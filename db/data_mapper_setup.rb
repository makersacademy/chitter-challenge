require 'data_mapper'
require 'dm-postgres-adapter'

#todo - add model files
require_relative '../lib/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

#This checks the models for validity and initializes all properties associated with relationships. 
DataMapper.finalize

#create tables if they don't exist
DataMapper.auto_upgrade!