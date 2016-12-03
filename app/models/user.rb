require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'

require 'bcrypt'

class User

  include DataMapper::Resource
  property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String
  property :password_digest, Text

  attr_reader :password


  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end



end
