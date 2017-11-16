require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
#
class User

include DataMapper::Resource

  property :id, Serial
  # property :name, String
  property :email, String
  # property :password, String

  property :password_digest, Text
  attr_accessor :password_confirmation
  attr_reader :password

  has n, :tweets, :through => Resource

  def password=(password)
  @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

validates_confirmation_of :password

end
