DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
require_relative './peep.rb'
require 'data_mapper'
require 'dm-migrations'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email_address, String
  property :password_digest, Text

  validates_confirmation_of :password

  attr_reader :password
  attr_accessor :password_confirmation


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end

DataMapper.finalize
DataMapper.auto_upgrade!
