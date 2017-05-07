require 'dm-postgres-adapter'
require 'data_mapper'
require 'bcrypt'

ENV["RACK_ENV"] ||= "development"

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String
  property :password_digest, Text

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end
end

DataMapper.setup(:default, "postgres://localhost/chitter_users_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
