require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, required: true
  property :name, String
  property :username, String
  property :password_digest, Text

  def password=(password)
    @password = password
   self.password_digest = BCrypt::Password.create(password)
  end

end
