require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'

class User
  include DataMapper::Resource
  has n, :peeps, :through => Resource

  property :id, Serial
  property :username, String
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, message:"Password and confirmation password do not match"
  validates_presence_of :password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
   user = first(username: username)
   if user && BCrypt::Password.new(user.password_digest) == password
     user
   else
     nil
   end
 end

end
