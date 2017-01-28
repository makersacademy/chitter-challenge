require 'bcrypt'

class User

include DataMapper::Resource
include BCrypt

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  attr_reader :password, :name, :password_digest
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    p user
    p BCrypt::Password.new(user.password_digest)
    if user && BCrypt::Password.new(user.password_digest) == password
      p user
      user
    else
      nil
    end
  end

  class <<self
    def count
      self.all.count
    end
  end

end
