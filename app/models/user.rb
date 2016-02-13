require 'bcrypt'

# User DataMapper class
class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String
  property :email, String, required: true
  property :name, String
  property :password_digest, String, length: 100
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = Password.create(password)
    self.password_digest = @password
  end
end
