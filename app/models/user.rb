require 'bcrypt'

class User
  attr_reader :password

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, String
  property :user_name, String

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end
