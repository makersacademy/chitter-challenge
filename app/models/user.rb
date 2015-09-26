require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  validates_confirmation_of :password
  validates_presence_of     :email

  property :id, Serial
  property :email, String, required: true
  property :name, String
  property :username, String
  property :password_digest, Text
  property :password_confirmation, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
