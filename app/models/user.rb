require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String, unique: true, required: true,
    messages: { is_unique: "Username already taken",
                presence: "Username needed" }
  property :email, String, unique: true, required: true, format: :email_address,
    messages: { is_unique: "Email already taken",
                presence: "Email address needed",
                format: "That doesn't seem to be a valid email" }
  property :password_digest, Text

  validates_confirmation_of :password,
    message: "Password and confirmation password don't match"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end