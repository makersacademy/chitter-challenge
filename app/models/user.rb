require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "Passwords don't match"
  validates_presence_of :password, message: "Enter a password, bitch."

  property :id, Serial
  property :username, String, required: true, unique: true,
    messages: {is_unique: "Username already taken"}

  property :password_digest, Text

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
