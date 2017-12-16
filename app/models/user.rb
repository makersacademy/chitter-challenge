require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :first_name, String
  property :last_name, String

  attr_accessor :password
  attr_accessor :password_confirm
end
