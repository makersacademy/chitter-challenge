require 'bcrypt'

class Maker
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_hash, String
  property :password_hash_confirmation, String

  # has n, :peeps, :through => Resource

  # validates_confirmation_of :password_hash
  #
  # def password=(new_password)
  #   @password = new_password
  #   self.password_hash = Password.create(new_password)
  # end
  #
  # attr_reader :password_hash_confirmation

end
