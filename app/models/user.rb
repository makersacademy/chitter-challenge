require "data_mapper"
require "dm-postgres-adapter"
require 'bcrypt'

class User

  include DataMapper::Resource

  attr_accessor :password_digest
  attr_reader :password

  property :id, Serial
  property :email, String
  property :password_digest, Text

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
