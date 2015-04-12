require 'data_mapper'
require 'byebug'

env = ENV['RACK_ENV'] || 'development'

if env == "production"
  DataMapper.setup(:default, "#{ENV['FRIDGEDOOR_DB_URL']}")
else
  DataMapper.setup(:default, "postgres://localhost/fridgedoor_#{env}")
end

require './app/models/note'
require './app/models/user'
require './app/models/reply'
require './app/models/tag'

DataMapper.finalize
DataMapper.auto_upgrade!