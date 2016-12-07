require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  has n, :peeps


  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text, required: true
  property :username, String, required: true
  property :name, String, required: true

  attr_reader :password


  def password=(password)
    @password=password
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

end
