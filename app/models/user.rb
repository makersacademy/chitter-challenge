require 'bcrypt'

class User
include DataMapper::Resource
include BCrypt

  has n, :peeps, through: Resource

  property :id,             Serial
  property :name,           String
  property :username,       String
  property :email,          String
  property :password_hash,  Text

  attr_reader :password

  def password=(password)
    @password = Password.create(password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end

end
