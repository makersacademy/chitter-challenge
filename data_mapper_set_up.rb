env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "/chittter_#{env}")

require './lib/user'
require './lib/peep'
require './lib/reply'

DataMapper.finalize
DataMapper.auto_upgrade!