require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'peep'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :username, String, required: true, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  has n, :peeps

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    end
  end
end
