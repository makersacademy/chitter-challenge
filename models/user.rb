

require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'
require 'bcrypt'

class User

  include DataMapper::Resource

  property :id,    Serial
  property :email,  String
  property :name,   String
  property :user_name, String
  property :password_digest, Text

  def password=(password)
    @password = password
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
# DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
