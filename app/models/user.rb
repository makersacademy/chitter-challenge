require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  property :id,       Serial
  property :name,     String
  property :username, String, required: true
  property :email,    String, required: true
  property :password_digest, Text

  validates_confirmation_of :password,
    message: 'Password and confirmation password do not match'
  validates_uniqueness_of :email, :username

  has n, :peeps
  has n, :replies

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    end
  end

end
