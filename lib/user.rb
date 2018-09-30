require_relative 'datamapper'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  has n, :messages
  property :id, Serial
  property :name, String
  property :password, String
  property :email, String
  property :username, String

  before :save do
    BCrypt::Password.create(password)
  end

end
