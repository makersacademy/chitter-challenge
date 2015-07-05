require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, required: true    # required for all
  property :username, String, required: true
  property :email, String, required: true, unique: true     # unique 
  property :password_digest, Text

  def password= password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  validates_presence_of :name
  validates_presence_of :username
  validates_presence_of :email
end