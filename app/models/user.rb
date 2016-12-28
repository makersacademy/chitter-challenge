require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_presence_of :email

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :username, String, required: true
  #property :password_confirmation, String, required: true
  property :password_digest, Text, required: true

  has n, :peeps

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
