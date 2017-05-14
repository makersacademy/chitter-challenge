require 'bcrypt'
require 'dm-validations'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, Text
  property :name, String
  property :username, String, required: true, unique: true

  has n, :bottles

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
