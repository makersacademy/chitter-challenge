require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, required: true, length: 1..50
  property :username, String, required: true, unique: true, length: 4..20
  property :email, String, required: true, unique: true, length: 5..50
  property :password, BCryptHash, required: true, length: 1..100

  validates_confirmation_of :password

  has n, :peep

end
