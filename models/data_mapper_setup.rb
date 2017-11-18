require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require './models/post.rb'

DataMapper::Model.raise_on_save_failure = true
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
