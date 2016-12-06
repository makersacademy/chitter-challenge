require 'bcrypt'
require 'dm-core'
require 'dm-validations'

class User
  include DataMapper::Resource

  has n, :peeps, through: Resource

  property :id, Serial
  property :email, String
  property :password, Text

  def self.authenticate(email, password)
    user = User.first(email: email)
  end

end
