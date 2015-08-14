require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require './app/link' # require each model individually - the path may vary depending on your file structure.

DataMapper.finalize

DataMapper.auto_upgrade!