require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, unique: true, required: true
  property :username, String, unique: true, required: true
  property :password_digest, Text
  property :name, String
#
#   has n, :peep
#
attr_reader :password
attr_accessor :password_confirmation

validates_confirmation_of :password

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
