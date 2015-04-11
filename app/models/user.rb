require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial, required: true
  property :email, String, required: true, unique: true
  property :name, String, required: true
  property :password_digest, Text
  property :username, String, required: true, unique: true

  def password
    @password ||= BCrypt::Password.new(password_digest)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_digest = @password
  end
end
