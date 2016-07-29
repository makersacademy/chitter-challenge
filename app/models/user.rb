require 'bcrypt'
require 'data_mapper'

class User

  include DataMapper::Resource

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
end
