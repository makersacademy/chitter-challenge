require 'data_mapper'
require './app/models/peep'
require './app/models/user'
require 'dm-validations'

if ENV['RACK_ENV'] == 'production'
  DataMapper.setup(:default, ENV['DATABASE_URL'])
else
  env = ENV['RACK_ENV'] || 'development'
  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
end


DataMapper.finalize
DataMapper.auto_upgrade!
