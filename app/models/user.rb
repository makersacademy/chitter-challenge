require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,             Serial
  property :email,          String
  property :name,           String
  property :username,       String
  property :user_password,  Text

  has n, :peeps

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.user_password = BCrypt::Password.create(password)
  end

end
