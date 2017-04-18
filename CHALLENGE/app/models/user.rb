require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,              Serial
  property :username,        String, required: true, unique: true
  property :email,           String, required: true, unique: true
  property :password_digest, Text

  attr_reader :password, :email
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
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
