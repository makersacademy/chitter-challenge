require_relative 'datamapper'

class User
  include DataMapper::Resource
  validates_uniqueness_of :email, :username

  has n, :peeps

  property :id,         Serial
  property :peeper,     String
  property :username,   String
  property :email,      String
  property :password,   String, :length => 60
end
