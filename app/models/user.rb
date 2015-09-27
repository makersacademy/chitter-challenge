require 'data_mapper'
require './app/data_mapper_setup'
require 'bcrypt'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  property :id, Serial
  property :email, String,  required: true
  property :password_digest, Text
  property :name, String
  property :username, String # This might be special like password.

  has n, :peeps, through: Resource

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
   user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end



end