require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,                 Serial
  property :name,               String
  property :username,           String, unique: true
  property :email,              String, unique: true
  property :password_digest,    Text

  has n, :cheeps


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user
      BCrypt::Password.new(user.password_digest) == password ? user : false
    else
      nil
    end
  end

end