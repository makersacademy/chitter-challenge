require_relative 'datamapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  validates_uniqueness_of :email, :username

  has n, :peeps

  property :id,         Serial
  property :peeper,     String
  property :username,   String
  property :email,      String
  property :password,   String, :length => 60

  before :save do
    BCrypt::Password.create(password)
  end
end
