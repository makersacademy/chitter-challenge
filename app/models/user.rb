require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,              Serial
  property :username,        String
  property :name,            String
  property :email_address,   String
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email_address, password)
    user = first(email_address: email_address)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end
end
