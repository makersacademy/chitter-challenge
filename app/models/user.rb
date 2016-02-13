require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String, required: true
  property :password_hash, Text

  attr_reader :password, :email
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

end
