require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password, :name
  attr_accessor :password_confirmation

  has n, :peeps

  property :id,              Serial
  property :name,            String
  property :email,           String, required: true, unique: true
  property :password_digest, Text

  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
