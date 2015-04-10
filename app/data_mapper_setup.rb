require 'data_mapper'

env = ENV['RACK_ENV'] || 'development'

if env == 'production'
  DataMapper.setup(:default, "#{ENV['BLABBER_DB_URL']}")
else
  DataMapper.setup(:default, "postgres://localhost/blabber_#{env}")
end

require './app/models/blabbs'
require './app/models/user'

DataMapper.finalize

DataMapper.auto_upgrade!