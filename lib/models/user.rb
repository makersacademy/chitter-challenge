require 'data_mapper'
require './database_connection_setup.rb'
# require './lib/models/message.rb'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :email,      String, required: true
  property :password,   String, required: true
  property :name,       String
  property :user_name,  String

  # has n, :messages
end

DataMapper.auto_upgrade!
