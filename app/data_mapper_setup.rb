require 'data_mapper'
require 'dm-validations'

env = ENV['RACK_ENV'] || 'development'

if ENV['RACK_ENV'] == 'production'
  DataMapper.setup(:default, ENV['DATABASE_URL'])
else
  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
end

require './app/models/user'
require './app/models/peep'

DataMapper.finalize

DataMapper.auto_upgrade!
