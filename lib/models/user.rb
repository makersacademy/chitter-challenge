require 'bcrypt'

class User

include DataMapper::Resource

property :id, Serial, required: true
property :name, String, required: true
property :username, String, :unique => true, required: true
property :email, String, format: :email_address, :unique => true, required: true
property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
  user = first(email: email)
  if user && BCrypt::Password.new(user.password_digest) == password
    user
  else
    nil
  end
end


end
