require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include BCrypt
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String, required: true, unique: true
  property :password, BCryptHash

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  attr_reader :password
  attr_accessor :password_confirmation

  # def password=(password)
  #   @password = password
  #   self.password_digest = BCrypt::Password.create(password)
  # end

end
