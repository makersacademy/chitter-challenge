require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property(:id, Serial)
  property(:username, String, length: 20)
  property(:name, String)
  property(:email, String)
end
