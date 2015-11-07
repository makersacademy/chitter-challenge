require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String
  property :password_hash, String, length: 60

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

end
