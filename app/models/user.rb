require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peeps

  validates_confirmation_of :password
  validates_presence_of :password

  property :id, Serial
  property :email, String, unique: true, required: true
  property :password_digest, Text, required: true

  property :name, String, required: true
  property :username, String, unique: true, required: true

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