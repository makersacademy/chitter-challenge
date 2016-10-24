require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :user_name, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :password_digest, Text, :required => true
  has n, :peeps

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
