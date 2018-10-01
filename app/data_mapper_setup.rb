require 'data_mapper'
require_relative './models/peep'
require_relative './models/user'
require_relative './models/reply'

env = ENV['DATABASE_URL'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
