require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'
require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :peeps

  property :id,   Serial
  property :name, String, required: true
  property :email, String, required: true, unique: true
  property :password_hash, Text, required: true

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password
      user
    else
      nil
    end
  end
end
