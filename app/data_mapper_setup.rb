ENV['RACK_ENV'] ||= 'development'

require_relative 'models/peep'

db = "postgres://localhost/chitter_#{ENV['RACK_ENV']}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || db)
DataMapper.finalize
DataMapper.auto_upgrade!
