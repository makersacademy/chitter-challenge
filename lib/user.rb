require 'bcrypt'
require 'data_mapper'
require 'dm-validations'

class User

  include DataMapper::Resource
  include DataMapper::Validations
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  property :password_digest, Text

  validates_confirmation_of :password

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

end