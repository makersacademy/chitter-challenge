require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :name, String, required: true
  property :digest, Text, required: true
  property :handle, String, unique: true, required: true
  property :email, Text, unique: true, required: true

  def password=(password)
    @password = password
    self.digest = BCrypt::Password.create(password)
  end
end
