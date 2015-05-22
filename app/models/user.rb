require 'bcrypt'

class User

  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String, unique: true
  property :name, String
  property :username, String
  property :password_digest, Text
  validates_confirmation_of :password
  validates_uniqueness_of :email


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end