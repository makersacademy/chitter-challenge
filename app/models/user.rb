require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require_relative '../../data_mapper_setup'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id,              Serial
  property :username,        String, required: true, unique: true
  property :name,            String
  property :email,           String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  has n, :peeps

  validates_confirmation_of :password

  def password=(password)
    @password = password
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
