require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id,         Serial
  property :username,   String, required: true, unique: true
  property :email,      String, required: true, unique: true
  property :name,       String, required: true
  property :digest,     Text,   required: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.digest = BCrypt::Password.create(password)
  end
end
