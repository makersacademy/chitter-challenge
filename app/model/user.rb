require 'data_mapper'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(new_password)
    @password = new_password
    self.password_hash = Password.create(new_password)
  end

  property :id,              Serial
  property :email,           String, unique: true
  property :password_hash,   Text
  property :name,            String
  property :username,        String, unique: true

  validates_confirmation_of :password
end
