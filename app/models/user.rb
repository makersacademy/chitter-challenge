require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :user_name, String
  property :email,  String, required: true, format: :email_address
  property :password, String
  property :password_confirmation, String


  DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
  DataMapper.finalize
  DataMapper.auto_upgrade!

end
