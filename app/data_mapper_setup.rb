require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/user'

postgres_database = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
# Heroku created postgresql-corrugated-92367 as DATABASE_URL

DataMapper.setup(:default, ENV['DATABASE_URL'] || postgres_database)
DataMapper.finalize
DataMapper.auto_upgrade!
