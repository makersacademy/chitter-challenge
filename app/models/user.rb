require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :name, String, required: true
  property :email, String, required: true
  property :username, String, required: true
  property :encrypted_password, Text

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  has n, :peeps, :through => Resource
end
