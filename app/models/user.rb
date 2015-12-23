require 'data_mapper'
require 'bcrypt'
require 'dm-validations'
require 'dm-postgres-adapter'
require 'dm-migrations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, :unique => true
  property :email, String
  property :password_digest, Text

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, :confirm => :password_confirmation
  # validates_with_method :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
