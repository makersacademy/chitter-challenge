require 'bcrypt'
# :nodoc:
class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id,         Serial
  property :name,       String
  property :user_name,  String
  property :email,      String, format: :email_address, required: true
  property :password_digest,   Text

  validates_confirmation_of :password

  def password=(password)
    @password = password
   self.password_digest = BCrypt::Password.create(password)
  end
end
