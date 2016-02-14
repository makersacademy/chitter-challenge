require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :password_str, Text

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_str = BCrypt::Password.create(password)
  end

end
