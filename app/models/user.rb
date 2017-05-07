require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource
  attr_reader :password, :username
  attr_accessor :password_confirmation

  property :id,            Serial
  property :name,          String
  property :username,      String, required: true, unique: true
  property :email,         String, format: :email_address, unique: true, required: true
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
