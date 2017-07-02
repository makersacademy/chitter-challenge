

require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation


  property :id, Serial
  property :email, String, :required => true, :unique => true
  property :name, String, :required => true
  property :username, String, :required => true, :length => 0..50,  :unique => true
  property :password_digest, Text, :required => true
  property :created_at, DateTime


  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
