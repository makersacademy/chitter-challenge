require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'user'

class Message
  include DataMapper::Resource
   belongs_to(:user)
   property(:id, Serial)
   property(:message, String, length: 60, required: true)
   property(:timestamp, DateTime, required: true)
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_chatter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
