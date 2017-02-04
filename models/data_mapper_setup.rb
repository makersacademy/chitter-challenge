require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require_relative 'user'
require_relative 'peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_challenge_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!
