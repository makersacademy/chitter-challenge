require 'bcrypt'
require 'data_mapper'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text
  property :password_token, Text
  property :name, String, required: true
  property :username, String, required: true

  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email


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

  # def self.change_password(password)
  #  user && BCrypt::Password.new(user.password_digest) == password
  # end

end