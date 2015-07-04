require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,            Serial
  property :email,         String
  property :password_hash, Text

  def password= password
    @password = password
    self.password_hash = BCrypt::Password.create password
  end

  def self.authenticate email, password
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end
end
