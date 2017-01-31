require 'dm-postgres-adapter'
require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/comment'
require 'dm-validations'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_db_#{ENV["RACK_ENV"]}")
DataMapper.finalize
