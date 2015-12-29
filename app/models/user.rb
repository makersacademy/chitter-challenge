require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :user_name, String
  property :email,  String, required: true
  property :password, String
  property :password_confirmation, String


  DataMapper.setup(:default, "postgres://localhost/chitter_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!

end
