require 'data_mapper'
# require 'dm-core'
require 'dm-timestamps'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String, :unique => true
  property :password, String
  # property :created_at, DateTime
  # property :updated_at, DateTime

  has n, :peeps
end
