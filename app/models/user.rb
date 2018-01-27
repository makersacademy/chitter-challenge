require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,              Serial
  property :email,           String
  property :username,        String
  property :password_hash,   Text

  def password=(password)
    self.password_hash = BCrypt::Password.create(password)
  end
  
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/peep_manager_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
