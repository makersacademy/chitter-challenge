require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

    validates_confirmation_of :password


  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true
  property :email, String, format: :email_address, required: true
  property :password_digest, Text, required: true

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end

DataMapper.setup(:default, 'postgres://localhost/chitter_test')
DataMapper.finalize
DataMapper.auto_upgrade!




