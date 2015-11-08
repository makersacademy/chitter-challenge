require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :username, String, required: true, unique: true
  property :password, BCryptHash, required: true

  attr_accessor :confirm_password

  validates_confirmation_of :password, confirm: :confirm_password

end
