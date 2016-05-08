require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String, required: true, unique: true,
    format: :email_address, messages: {
      presence: "We need your email address",
      is_unique: "This email has been registered",
      format:  "Invalid email address"
    }
  property :password_digest, Text
  property :name, String, required: true, messages: {
      presence: "We need your name"
   }
  property :username, String, required: true, unique: true,
            messages: {
            is_unique: "This username has been registered",
            presence: => "We need your username"
                                              }

  validates_confirmation_of :password, message: "Password and confirmation password do not match"

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end