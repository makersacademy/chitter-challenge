require "bcrypt"
require "dm-validations"

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, format: :email_address, unique: true
	property :password_digest, Text, required: true

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, attempted_password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == attempted_password
      user
    end
  end
end
