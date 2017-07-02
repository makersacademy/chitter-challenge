require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/peep'
require_relative 'models/tag'
require_relative 'models/user'

t = DateTime.now
t.strftime("%b %d %Y %I:%M %p ")

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
