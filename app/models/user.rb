require 'dm-postgres-adapter'
require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :confirm_password

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
