require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

 # has n, :peeps, through: Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(name, username, email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password && user.name == name && user.username == username
      user
    else
      nil
    end
  end
end
