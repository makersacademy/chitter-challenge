require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_chatter_#{ENV['RACK_ENV']}")
# p ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_#{ENV['RACK_ENV']}"
DataMapper.finalize
DataMapper.auto_upgrade!
# DataMapper::Model.raise_on_save_failure = true
