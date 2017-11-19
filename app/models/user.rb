require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :email,            String, required: true, format: :email_address
  property :password_digest,  Text
  property :name,             String
  property :user_name,        String

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
