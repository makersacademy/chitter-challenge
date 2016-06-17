require 'data_mapper'

class User

include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true
  property :password, String
  property :username, String, required: true


end
