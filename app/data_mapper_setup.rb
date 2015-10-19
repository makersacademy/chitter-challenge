env = ENV['RACK_ENV'] || 'development'

require 'data_mapper'
require './app/models/user'
require './app/models/post'
require 'dm-validations'
require 'dm-timestamps'


if ENV["RACK_ENV"] == 'production'
  DataMapper.setup(:default, ENV["DATABASE_URL"])
else
  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")
end


DataMapper.finalize
DataMapper.auto_upgrade!