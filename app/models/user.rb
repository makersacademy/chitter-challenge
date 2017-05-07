require 'bcrypt'

class User
  include DataMapper::Resource


  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String, format: :email_address, required: true
  property :password_digest, Text

  # validates_presence_of :email

  # has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
