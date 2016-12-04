require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :username, String, required: true, unique: true
  property :name, String, required: true


  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

  def password=(password)
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
