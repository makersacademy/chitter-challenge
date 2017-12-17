require "data_mapper"
require "dm-postgres-adapter"
require "bcrypt"
require "dm-validations"

class User
  include DataMapper::Resource

  property :id,              Serial
  property :name,            String
  property :username,        String
  property :email,           String
  property :password_digest, Text

  has n, :peeps

  def password_digest=(password)
    super BCrypt::Password.create(password)
  end
end
