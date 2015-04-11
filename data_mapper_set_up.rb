env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chittter_#{env}")

require './lib/user'
require './lib/peep'
require './lib/reply'
require './helpers'

DataMapper.finalize
DataMapper.auto_upgrade!