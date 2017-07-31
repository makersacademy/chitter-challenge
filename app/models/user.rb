require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,              Serial
  property :email,           String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :username,        String, unique: true, required: true
  has n, :posts, through: Resource

  validates_confirmation_of :password, required: true

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
