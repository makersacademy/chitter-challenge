require 'BCrypt'
class User
  attr_reader :password
  attr_accessor :password_confirmation
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :username, String
  property :password_digest, Text
  validates_confirmation_of :password, message: "Those passwords don't match"
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end