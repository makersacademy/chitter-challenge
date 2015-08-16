require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, Text
  property :name, Text
  property :username, Text
  property :password_digest, Text

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
