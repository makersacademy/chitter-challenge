require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  # include BCrytp
  attr_reader :password


  property :id, Serial
  property :username, String
  property :password, String
end
