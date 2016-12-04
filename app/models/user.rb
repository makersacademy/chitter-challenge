require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'pry'

class User

  include DataMapper::Resource
  property :id, Serial
  property :name, String, required: true
  property :user_name, String, required: true
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true

  has n, :peeps



  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end


  def self.authenticate(user_name, password)
    user = first(user_name: user_name)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
