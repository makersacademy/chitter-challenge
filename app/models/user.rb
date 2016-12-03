require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email

  property :id, Serial
  property :email, String, required: true
  property :username, String, required: true
  property :password_confirmation, String, required: true
  property :password_digest, Text, required: true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
