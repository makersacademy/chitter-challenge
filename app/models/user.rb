require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id , Serial
  property :name , String, required: true
  property :username , String, required: true, unique: true
  property :email , String, required: true, unique: true
  property :password_digest , Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    end

end
