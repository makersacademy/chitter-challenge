require 'bcrypt'
class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :user_name, String
  property :hash_password, Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.hash_password = BCrypt::Password.create(password)
  end

end
