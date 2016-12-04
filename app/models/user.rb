require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :password_digest, Text

  def password_method2=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/twitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
