require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :username, Text, required: true
  property :password_digest, Text
  # property :name, Text
  # property :surname, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  attr_reader :password

  validates_uniqueness_of :email
  validates_uniqueness_of :username


end