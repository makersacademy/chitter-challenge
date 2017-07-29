require 'BCrypt'
class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest,      Text
  validates_confirmation_of :password, :message => 'Passwords do not match'

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end
end
