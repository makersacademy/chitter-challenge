# require 'data_mapper'
# require './database_connection_setup.rb'

# class Message
#   include DataMapper::Resource

#   property :id,           Serial
#   property :text,         String,    required: true
#   property :created_at,   DateTime  
  
#   belongs_to :user
# end

# class User
#   include DataMapper::Resource

#   property :id,         Serial
#   property :email,      String, required: true
#   property :password,   String, required: true
#   property :name,       String
#   property :user_name,  String

#   has n, :messages
# end

# DataMapper.finalize
# DataMapper.auto_upgrade!