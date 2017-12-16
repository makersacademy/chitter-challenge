require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :email, String
  property :username, String
  property :first_name, String
  property :last_name, String
  property :password_hash, Text

  attr_reader :password
  attr_accessor :password_confirm

  def password=(password)
    @password = password
    self.password_hash = Password.create(password)
  end

  def authenticate(password)
    Password.new(password_hash) == password
  end
end
