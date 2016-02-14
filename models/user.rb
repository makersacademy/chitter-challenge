require 'bcrypt'

class User
  include DataMapper::Resource
 
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :name, String
  property :user_name, String
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
end
