require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id,              Serial
  property :email,           String, format: :email_address, required: true, unique: true
  property :username,        String, required: true, unique: true
  property :first_name,      String
  property :last_name,       String
  property :password_digest, Text
  property :avatar,          String, :default  => "avatar-default-164.png"

  has n, :peeps

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
