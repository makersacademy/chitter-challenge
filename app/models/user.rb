require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true,
                           message: "There is already a user with this email!"
  property :name, String
  property :password_digest, Text
  property :username, String, unique: true,
                              message: "There is already a user with this username!"

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end
end
