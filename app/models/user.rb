require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User
  include DataMapper::Resource

  property :id,   Serial
  property :name, String
  property :email, String, format: :email_address, unique: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
