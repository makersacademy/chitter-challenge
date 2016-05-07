require "bcrypt"
require "dm-validations"

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, format: :email_address, unique: true
	property :password_digest, Text, required: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
