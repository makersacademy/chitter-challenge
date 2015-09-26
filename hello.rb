require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_uniqueness_of   :email

  property :id, Serial
  property :email, String, required: true
  property :name, String
  property :username, String
  property :password_digest, Text
  property :password_confirmation, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
