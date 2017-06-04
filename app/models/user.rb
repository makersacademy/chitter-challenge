require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  has n, :messages

  property :id,               Serial
  property :user_name,        String
  property :user_email,       String, :required => true, :unique => true
  property :password_digest,  Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :user_email, :as => :email_address

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password::create(password)
  end

end
