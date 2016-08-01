require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, String, length: 60

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
