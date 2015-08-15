require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{env}")

require_relative './models/user'
# require_relative './models/tag'
# require_relative './models/user'

DataMapper.finalize

DataMapper.auto_upgrade!