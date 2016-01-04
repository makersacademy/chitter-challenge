
require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, unique: true, format: :email_address, required: true
  property :password_digest, Text

  validates_confirmation_of :password

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
