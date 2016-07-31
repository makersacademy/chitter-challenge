require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, String, length: 60
  
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
