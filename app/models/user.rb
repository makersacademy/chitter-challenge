require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'


class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial #a column in the table/database
  property :username, String
  property :name, String
  property :password_digest, Text
  property :email, String

   def password=(password)
     self.password_digest = BCrypt::Password.create(password)
   end

  def self.verify(username, password)
    user = first(username: username)#??????
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end



end
