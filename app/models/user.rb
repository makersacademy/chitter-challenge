require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, message: 'This email is already taken'
  property :user_name, String, unique: true, message: 'This name is already taken'
  property :user_handle, String, unique: true, message: 'This handle is already taken'
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :user_name
  validates_uniqueness_of :user_handle

  def self.authenticate email, password
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
