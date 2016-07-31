require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id,              Serial
  property :name,            String
  property :email,           String
  property :password, String, length: 20

end
