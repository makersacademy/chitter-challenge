require 'data_mapper'

class User
  include DataMapper::Resource
  property :id,         Serial
  property :name,       String
  property :username,   String
  property :email,      String
  property :password,   Text

  # attr_reader :password

  # has n, :links

  # def password=(password)
  #   self.password_digest = BCrypt::Password.create(password)
  # end
end
