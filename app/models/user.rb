require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, unique: true, required: true
  property :email, String, required: true, unique: true
  property :name, String
  property :password_digest, Text, required: true
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
end
