require 'data_mapper'
require 'dm-postgres-adapter'
require_relative './peep.rb'
require 'bcrypt'

# DataMapper.setup(:default,
# ENV['DATABASE_URL'] || "postgres://localhost/chitter_db_#{ENV['RACK_ENV']}")

class User

  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :password_hash, Text

  has n, :peep, :through => Resource

  attr_reader :password
  attr_accessor :password_confirmation

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

end

# DataMapper.finalize
# DataMapper.auto_upgrade!
