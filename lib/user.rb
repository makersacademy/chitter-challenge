require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true
  property :password_digest, Text

  has n, :peeps, :through => Resource

  # Bcrypt has good documentation on password recovery as well

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end
end
