require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

require_relative 'user'
require_relative 'peep'

DataMapper.finalize
# Possibly move this to rakefile or something later
DataMapper.auto_upgrade!