require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text
  property :name, String
  property :user_name, String, unique: true

  attr_reader :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end