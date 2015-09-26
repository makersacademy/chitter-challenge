require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String, unique: true, required: true
  property :email, String, unique: true, required: true
  property :password_digest, Text

  validates_confirmation_of :password,
    message: 'Password and confirmation password do not match'

  validates_uniqueness_of :email,
    message: "Email is already taken"

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
