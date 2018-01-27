require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User
  include DataMapper::Resource

  property :id,     Serial
  property :email,   String
  property :password_set, Text


  def password=(password)
    self.password_set = BCrypt::Password.create(password)
  end


end
