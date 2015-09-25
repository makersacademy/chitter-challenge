require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, unique: true, messages: {is_unique: "Email already taken"}
  property :password_digest, Text

  validates_confirmation_of :password, message: "Password and confirmation password don't match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end