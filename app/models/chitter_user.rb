require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'

class Chitter_User
  include DataMapper::Resource

  property :id, Serial
  property :user_email, String
  property :user_full_name, String
  property :user_name, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)

  end

end


DataMapper.setup(:default, 'postgres://localhost/chitter_development')
DataMapper.finalize
DataMapper.auto_upgrade!
