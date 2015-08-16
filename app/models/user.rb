require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password_digest, Text

  validates_presence_of :name
  validates_presence_of :user_name
  validates_presence_of :email

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
  
end