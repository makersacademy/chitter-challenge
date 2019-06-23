require 'data_mapper'
require './database_connection_setup.rb'

class Messages
  include DataMapper::Resource

  property :id,           Serial
  property :text,         String,    required: true
  property :created_at,   DateTime
  property :updated_at,   DateTime   
end

DataMapper.auto_upgrade!