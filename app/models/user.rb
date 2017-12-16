require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :email,          String, unique: true, format: :email_address
  property :name,           String
  property :username,       String, :unique => true
  property :user_password,  Text

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "Your passwords do not match!"

  def password=(password)
    @password = password
    self.user_password = BCrypt::Password.create(password)
  end

end
