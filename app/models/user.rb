require 'data_mapper'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_digest, Text
  has n,   :peeps

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def password=(password)
     @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
