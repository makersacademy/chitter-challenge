require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, required: true, unique: true
  property :password, Text

  validates_confirmation_of :password

  def password_digest=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end
