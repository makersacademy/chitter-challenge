require 'bcrypt'
require 'dm-validations'

class User
  
  include DataMapper::Resource
  
  
  property :id, Serial
  property :email, String
  property :name, String
  property :user_name, String
  property :password_digest, Text
  
  attr_reader :password
  attr_accessor :password_confirmation
  
  validates_confirmation_of :password
  validates_length_of :password, :within => 6..8
  validates_uniqueness_of :email, :user_name
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  
end
