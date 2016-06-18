require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "Passwords did not match"

  property :id, Serial
  property :name, String
  property :username, String, required: true, unique: true,
            messages: {
            presence: "We need your username",
            is_unique: "This username is already taken"
            }

  property :email, String, format: :email_address, required: true, unique: true,
            messages: {
            presence: "We need your email address",
            format: "Invalid email format",
            is_unique: "This email address is already taken"
            }

  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    if user = User.first(username: username)
      return true if BCrypt::Password.new(user.password_digest) == password
    end
    false
  end

end
