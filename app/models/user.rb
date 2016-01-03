require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation
  attr_reader :password

  property :id,       Serial
  property :name,     String, required: true
  property :username, String, unique: true, required: true
  property :email,    String, unique: true, format: :email_address, required: true
  property :password_digest, Text

  validates_confirmation_of :password

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
