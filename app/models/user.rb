require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user_name, String, required: true
  property :email, String, format: :email_address, required: true
  property :password_digest, String, length: 60

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
