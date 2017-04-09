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

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
