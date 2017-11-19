require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'peep.rb'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, Text
  property :hashed_password, Text
  property :first_name, String
  property :last_name, String
  property :username, String

  has n, :peeps, :through => Resource

  def password=(password)
    self.hashed_password = BCrypt::Password.create(password)
  end
end
