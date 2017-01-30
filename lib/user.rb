require 'data_mapper'
# require 'bcrypt'
# require 'dm-validations'

class User

  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :password, String
  property :email, String

end
