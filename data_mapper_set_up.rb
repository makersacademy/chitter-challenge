env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './lib/user'
require './lib/peep'
require './lib/reply'

DataMapper.finalize
DataMapper.auto_upgrade!