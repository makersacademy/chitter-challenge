DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
require_relative './peep.rb'
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require 'time'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email_address, String
  property :password_digest, Text

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

   # has n, :peep, :through => Resource
end

DataMapper.finalize
DataMapper.auto_upgrade!
