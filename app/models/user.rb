require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :password, :username, :name, :email
  validates_uniqueness_of :email, :username

  property :id, Serial
  property :email, String
  property :password_digest, Text

  property :name, String
  property :username, String

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    @user = first(email: email)
    if @user && BCrypt::Password.new(@user.password_digest) == password
      @user
    end
  end

end