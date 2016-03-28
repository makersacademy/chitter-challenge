require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  has n, :peeps #, :through => Resource

end
