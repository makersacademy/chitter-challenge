require 'bcrypt'
require 'data_mapper'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, :unique => true
  property :email, String, format: :email_address, required: true, :unique => true
  property :password_digest, Text


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end

end
