require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :passwordconf


  include DataMapper::Resource

  validates_confirmation_of :password

  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, String
  property :user_name, String




  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end



end
