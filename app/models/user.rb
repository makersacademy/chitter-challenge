require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  has n, :peep

  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, format: :email_address, :required => true
  property :password, BCryptHash, :required => true

end
