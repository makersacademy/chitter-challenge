require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :email, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_encrypt, Text
  has n, :peeps, through: Resource
  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_encrypt = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_encrypt) == password
      user
    else
      nil
    end
  end
end
