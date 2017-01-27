#understands how to authenticate itself
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, 	  Serial
  property :email,  String,
           format: :email_address,
           unique: true
  property :full_name, String
  property :user_name, String,
           unique: true
  property :password_digest, String, length:60

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(email: email)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end
end
