require_relative 'models/user'
require_relative 'models/peep'
require_relative 'models/comment'

env = ENV['RACK_ENV'] || 'development'
DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

DataMapper.finalize
DataMapper.auto_upgrade!