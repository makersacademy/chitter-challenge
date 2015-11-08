require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, String
  property :user_name, String

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
