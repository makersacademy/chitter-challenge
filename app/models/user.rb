require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id,                   Serial
  property :email,                String, required: true, format: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  property :password_digest,      Text

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
