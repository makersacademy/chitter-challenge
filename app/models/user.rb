require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :length => 0..30
  property :name, Text
  property :email, Text
  property :password_digest, Text


  attr_accessor :password_confirmation
  validates_confirmation_of :password, :message => "Sorry, your passwords don't match"
  validates_presence_of :username, :email, :message => "User name and email are required for chitter"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end