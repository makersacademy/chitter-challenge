require 'bcrypt'

class Maker

  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,         Serial
  property :full_name,  String, required: true
  property :user_name,  String, required: true
  property :email,      String, format: :email_address, required: true
  property :password_digest,   Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
