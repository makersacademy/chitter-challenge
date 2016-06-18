require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class Users

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource
  property :id, Serial
  property :username, String
  property :password_digest, String, length: 60
  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end



end


DataMapper.setup(:default, "postgres://localhost/chitter_manager_test")
DataMapper.finalize
DataMapper.auto_upgrade!