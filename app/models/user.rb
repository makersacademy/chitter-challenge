require 'data_mapper'
require_relative './datamapper_settings'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :email, String, unique: true, required: true
  property :password_digest, Text
  property :username, String, unique: true




  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  data_mapper_settings


end
