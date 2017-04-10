require 'bcrypt'
require 'dm-core'
require 'dm-validations'

class User

  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :name, String
  property :username, String
  property :id, Serial
  property :email, String
  property :password_digest, Text

  has n, :peeps

  validates_confirmation_of :password
  validates_uniqueness_of :email, :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
