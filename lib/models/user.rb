require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation


  property :id,              Serial
  property :name,            String
  property :email,           String, required: true, unique: true
  property :username,        String, required: true, unique: true
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def self.authenticate(username, password)
    user = first(username: username)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
