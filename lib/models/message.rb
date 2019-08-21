# require 'data_mapper'
# require './database_connection_setup.rb'
# require './lib/models/user.rb'

class Message
  include DataMapper::Resource

  property :id,           Serial
  property :text,         String,    required: true
  property :created_at,   DateTime  
  
  # belongs_to :user
end

# DataMapper.auto_upgrade!
