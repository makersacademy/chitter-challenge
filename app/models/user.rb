require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticated?(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_confirmation_of :password

end
