require 'bcrypt'
class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
 	property :password_digest, Text
  # has n :posts

	def password=(password)
    self.password_digest = BCrypt::Password.create(password)
 	end

  def self.authenticate email, password
    user = User.first(email: email)
    BCrypt::Password.new(user.password_digest) == password
  end
 end