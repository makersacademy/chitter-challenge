require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String
  property :username, String
  property :password_digest, Text
  property :password_confirm, Text
  property :name, String
#
#   has n, :peep
#
attr_reader :password

def self.authenticate username, password
  user = User.first(username: username)
  if user && BCrypt::Password.new(user.password_digest) == password
    user
  else
    nil
  end
end

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

#   # def create_peep peep content
#   #   peep.
#   # end
end
