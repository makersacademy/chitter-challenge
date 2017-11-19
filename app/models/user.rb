require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :username, Text
  property :email, Text
  property :password_digest, Text
  property :created_at, DateTime
  property :created_on, Date

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  has n, :peeps

end
