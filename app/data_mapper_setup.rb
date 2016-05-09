require "data_mapper"
require "dm-postgres-adapter"
require "pg"
require_relative "./models/user"
require_relative "./models/peep"

DataMapper.setup(:default,
                  ENV['DATABASE_URL']  ||
                  "postgres://localhost/chitter_challenge_#{ENV["RACK_ENV"]}")
DataMapper.finalize

DataMapper.auto_migrate! if ENV['RACK_ENV'] == 'test'
