require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  property :id,     Serial
  property :name,   String
  property :email,  String, format: :email_address, required: true, unique: true
  property :handle, String, required: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

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
