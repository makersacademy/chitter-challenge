require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, Text
  property :username, String
  property :email, Text
  property :password_hash, Text
  has n, :peeps

  def initialize params
    self.username = params[:username]
    self.name = params[:name]
    self.email = params[:email]
    self.password = params[:password]
  end

  def password= password
    self.password_hash = BCrypt::Password.create password
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_hash) == password
      return user
    else
      nil
    end
  end
end
