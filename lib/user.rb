require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :password_digest, Text

  # Bcrypt has good documentation on password recovery as well
  # def password=(password)
  #   password_digest = BCrypt::Password.create(password)
  # end

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end
end
