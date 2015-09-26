require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  validates_confirmation_of :password

  property :id, Serial
  property :email, String
  property :name, String
  property :username, String
  property :password_digest, Text
  property :password_confirmation, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
end

end
