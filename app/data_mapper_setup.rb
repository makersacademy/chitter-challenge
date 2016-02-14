require_relative 'models/user'
require_relative 'models/message'
require_relative 'models/message_stream'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter-#{ENV['RACK_ENV']}")
DataMapper::Logger.new($stdout, :debug)
DataMapper.finalize
DataMapper.auto_upgrade!





