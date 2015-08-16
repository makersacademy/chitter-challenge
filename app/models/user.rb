require 'bcrypt'


class User
  include DataMapper::Resource

  attr_reader :name, :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :email, :name, :username

  property :id, Serial
  property :name, String
  property :email, String, unique: true
  property :username, String, unique: true
  property :password_digest, Text
  #has n, :post

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end



end