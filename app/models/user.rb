require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id,              Serial
  property :email,           String, required: true, unique: true,
    format: :email_address,
    messages: {
      :presence  => "We need your email address.",
      :is_unique => "We already have that email.",
      :format    => "Doesn't look like an email address to me ..."
    }
  property :name,            String
  property :username,        String
  property :password_digest, Text

  def password=(password)
    @password = password
   self.password_digest = BCrypt::Password.create(password)
  end

end
