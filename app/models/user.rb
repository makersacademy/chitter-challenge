require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peeps

  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

end