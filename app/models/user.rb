
require 'bcrypt'

class User
  include DataMapper::Resource
  validates_presence_of :email

  attr_reader :name, :user_name, :email, :password

  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String, required: true
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
