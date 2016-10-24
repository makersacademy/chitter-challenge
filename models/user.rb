require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  attr_accessor :password

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username_db, String
  property :email_db, String
  property :password_db, Text


  def password=(password)
    self.password_db = BCrypt::Password.create(password)
  end

  
  # def create_password(pw)
  #   @password = BCrypt::Password.create(pw)
  # end
  #
  # def password_class
  #   @password ||= Password.new(password_hash)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password_hash = @password
  # end

end
