require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

  attr_reader :password

  include DataMapper::Resource

  property :id,    Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text


end

DataMapper.setup(:default, "postgres://localhost/chitter_test")
DataMapper.finalize
DataMapper.auto_upgrade!
