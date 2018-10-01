require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

require './lib/message.rb'
require './lib/user.rb'

DataMapper.setup(:default, "postgres://localhost/twittarr_#{env}")

DataMapper.finalize

DataMapper.auto_upgrade!
