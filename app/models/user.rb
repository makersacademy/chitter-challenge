require 'data_mapper'
require 'dm-postgres-adapter'


require 'bcrypt'

class User

  include DataMapper::Resource
  property :id, Serial, required: true
  property :name, String, required: true
  property :user_name, String, required: true
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true

  attr_reader :password


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end



end
