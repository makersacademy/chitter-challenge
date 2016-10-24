require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'app'
require_relative 'models/user'
require_relative 'models/send_recover_link'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres:///chitter_challenge_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
