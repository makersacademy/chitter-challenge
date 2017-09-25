require 'bcrypt'
require 'dm-validations'
require_relative 'post'
# for handling users and their log ins
class User
  include DataMapper::Resource
  attr_reader :password, :name
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :email, String
  property :name, String
  property :password_digest, Text

  has n, :posts

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(name, password)
    user = first(name: name)

    user if user && BCrypt::Password.new(user.password_digest) == password
  end
end
