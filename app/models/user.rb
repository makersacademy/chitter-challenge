require 'bcrypt'

class User

  attr_reader :password
  attr_reader :username

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: email_address, required: true, unique: true
  property :username, String, length: 15
  property :password_digest, String, length: 25

  def password=(password)
    @password = password_digest
    self.password_digest = BCrypt::Password.create(password)
  end

end
