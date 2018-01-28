require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  has n, :peeps


  property :id, Serial
  property :username, String
  property :email, String, format: :email_address, required: true
  property :password_hash, Text

  # validates_confirmation_of :password
  # validates_format_of :email, as: :email_address

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end
end
