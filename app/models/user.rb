require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, unique: true, format: :email_address, required: true
  property :password_digest, Text, required: true
  property :username, String, unique: true, required: true
  property :name, String, required: true

  def password=(password)
    return if password.length.zero?
    @password = password
    self.password_digest = Password.create(password)
  end

  validates_confirmation_of :password

end
