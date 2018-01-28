require 'bcrypt'
# require 'dm-validations'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String, required: true
  property :encrypted_password, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

end
