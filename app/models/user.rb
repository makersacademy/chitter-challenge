require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true
  property :name, String
  property :email, String, unique: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of :username
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end