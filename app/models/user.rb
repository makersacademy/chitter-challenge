require 'data_mapper'
require 'bcrypt'
require 'pry'

class User
  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation


  property :id, Serial
  property :username, String
  property :name, String
  property :email, String
  property :password_digest, Text

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password



end