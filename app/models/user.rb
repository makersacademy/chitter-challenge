require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_again

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password_digest, Text

  has n, :peeps

  validates_uniqueness_of :email, :username

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
