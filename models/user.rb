require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String, required: true
  property :email, String, format: :email_address, required: true
  property :user_name, String, required: true
  property :hash_password, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.hash_password = BCrypt::Password.create(password)
  end

end
