require "bcrypt"
require "dm-validations"
require "securerandom"

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String,
            required: true,
            unique: true
  property :email, String,
            format: :email_address,
            required: true,
            unique: true
  property :password_hash, Text

  attr_accessor :password_confirmation
  attr_reader :password
  validates_confirmation_of :password

  has n, :peeps

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    return user if user && BCrypt::Password.new(user.password_hash) == password
    nil
  end
end
