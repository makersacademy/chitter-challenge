
require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  attr_reader :username

  has n, :peeps

  property :id, Serial
  property :email, String, required: true, unique: true
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :password_digest, Text, required:true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    end
  end
end