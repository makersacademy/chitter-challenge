require 'bcrypt'
require_relative 'dm_setup'

class Owl
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end 

  validates_presence_of :password, :username, :name, :email
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password

  has n, :twits

  property :id, Serial
  property :name, String
  property :username,String
  property :email, String
  property :password_digest, Text
end