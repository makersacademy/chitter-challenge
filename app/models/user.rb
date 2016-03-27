require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

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
    user = first(email:email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
DataMapper.setup(:default, "postgres://localhost/chitter_#{RACK_ENV}")
DataMapper.finalize
DataMapper.auto_migrate!
