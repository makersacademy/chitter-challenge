require 'require_all'
require 'data_mapper'
require 'dm-core'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require_rel 'models/*'

env = ENV['RACK_ENV']
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!
