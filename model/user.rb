require 'data_mapper'
require 'dm-postgres-adapter'
require 'BCrypt'

class User

  include DataMapper::Resource
  # attr_accessor :password

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
