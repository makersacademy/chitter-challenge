require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, :required => true, :unique => true
  property :password_digest, Text, :required => true
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true
  # has n, :tags, :through => Resource

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
