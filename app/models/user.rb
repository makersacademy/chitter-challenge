require "data_mapper"
require "dm-timestamps"
require "bcrypt"

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String
  property :username, String
  property :name, String
  property :password_digest, Text
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
