env = ENV["RACK_ENV"] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter-challenge_#{env}")

require_relative 'models/peep'
require_relative 'models/user'

DataMapper.finalize
DataMapper.auto_upgrade!