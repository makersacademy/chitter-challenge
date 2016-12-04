require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_accessor :password_confirmation, :password_digest, :password

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_confirmation_of :password

end
