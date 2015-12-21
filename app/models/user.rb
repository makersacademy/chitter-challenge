require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, required: true
  property :password_digest, Text

  validates_confirmation_of :password, message: 'Password confirmation incorrect'
  validates_format_of :email, as: :email_address, message: 'Please enter a valid email address'
  validates_uniqueness_of :email, message: 'Email already registered'
  validates_uniqueness_of :username, message: 'Username already registered'

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end
end

DataMapper.finalize
