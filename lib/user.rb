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
  validates_uniqueness_of :email

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